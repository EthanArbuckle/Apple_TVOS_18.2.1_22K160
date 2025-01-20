@interface SUCoreSimulate
+ (id)sharedSimulator;
- (BOOL)_isImmediateEvent:(id)a3;
- (BOOL)_isValidEvent:(id)a3;
- (BOOL)_parseDictionaryFromString:(id)a3 destination:(id *)a4;
- (BOOL)_parseErrorCodeFromString:(id)a3 destination:(int64_t *)a4;
- (BOOL)_parseEventBooleanFromString:(id)a3 destination:(int64_t *)a4;
- (BOOL)_parseIntFromString:(id)a3 destination:(int *)a4;
- (BOOL)_parseOptionalEntriesInLineFromWords:(id)a3 argStartAt:(int *)a4 argEndAt:(int *)a5 argDuration:(int *)a6 argUntilStop:(id *)a7 argAssetBuildVersions:(id *)a8 argAssetProductVersions:(id *)a9 argAssetAttributesPlist:(id *)a10 argAssetState:(id *)a11 argUpdateInfoPlist:(id *)a12 argErrorDomain:(id *)a13 argErrorCode:(int64_t *)a14 argErrorUserInfo:(id *)a15 argErrorRecoverable:(int64_t *)a16;
- (BOOL)simulatorEnabled;
- (NSDictionary)eventAlterations;
- (OS_dispatch_queue)simulateQueue;
- (SUCoreSimulate)init;
- (SUCoreSimulateEvent)lastAlteration;
- (id)_eventFromLine:(id)a3;
- (id)_locateEventForModule:(id)a3 forIdentity:(id)a4 withTrigger:(int64_t)a5 forEvent:(id)a6 inState:(id)a7;
- (id)_performOffQueueEvent:(id)a3;
- (id)_performSimulatedEventAlteration:(id)a3;
- (id)_splitString:(id)a3 byTheFirstOccurrenceOf:(id)a4;
- (id)begin:(id)a3 atFunction:(id)a4;
- (id)end:(id)a3 atFunction:(id)a4;
- (id)fsm:(id)a3 forEvent:(id)a4 inState:(id)a5;
- (id)generateError:(id)a3 ofDomain:(id)a4 withCode:(int64_t)a5;
- (id)lastAlterationPerformed;
- (id)registeredCallback;
- (int)alterationsPerformed;
- (int)countOfAlterationsPerformed;
- (int64_t)_actionFromString:(id)a3;
- (int64_t)_triggerFromString:(id)a3;
- (void)_adoptAllEventAlterations:(id)a3;
- (void)_dumpAllEventAlterations;
- (void)_performingAlteration:(id)a3;
- (void)_triggerOffQueueAlteration:(id)a3;
- (void)adoptAllEventAlterations:(id)a3;
- (void)clearAllEventAlterations;
- (void)dumpAllEventAlterations;
- (void)setAlterationsPerformed:(int)a3;
- (void)setEventAlterations:(id)a3;
- (void)setLastAlteration:(id)a3;
- (void)setRegisteredCallback:(id)a3;
@end

@implementation SUCoreSimulate

+ (id)sharedSimulator
{
  if (sharedSimulator_simulatorOnce != -1) {
    dispatch_once(&sharedSimulator_simulatorOnce, &__block_literal_global);
  }
  return (id)sharedSimulator_simulator;
}

void __33__SUCoreSimulate_sharedSimulator__block_invoke()
{
  v0 = objc_alloc_init(&OBJC_CLASS___SUCoreSimulate);
  v1 = (void *)sharedSimulator_simulator;
  sharedSimulator_simulator = (uint64_t)v0;
}

- (SUCoreSimulate)init
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___SUCoreSimulate;
  v2 = -[SUCoreSimulate init](&v17, sel_init);
  if (v2)
  {
    v3 = +[SUCoreDevice sharedDevice](&OBJC_CLASS___SUCoreDevice, "sharedDevice");
    v2->_simulatorEnabled = [v3 isBootedOSSecureInternal];

    eventAlterations = v2->_eventAlterations;
    v2->_eventAlterations = 0LL;

    id registeredCallback = v2->_registeredCallback;
    v2->_id registeredCallback = 0LL;
    v6 = +[SUCore sharedCore](&OBJC_CLASS___SUCore, "sharedCore");
    [v6 commonDomain];
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    id v8 = [objc_alloc(NSString) initWithFormat:@"%@.%@", v7, @"core.simulate"];
    v9 = (const char *)[v8 UTF8String];
    dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v10 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue();
    dispatch_queue_t v11 = dispatch_queue_create(v9, v10);
    simulateQueue = v2->_simulateQueue;
    v2->_simulateQueue = (OS_dispatch_queue *)v11;

    if (v2->_simulateQueue)
    {
      v13 = +[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger");
      [v13 oslog];
      v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v19 = v7;
        __int16 v20 = 2112;
        v21 = @"core.simulate";
        _os_log_impl( &dword_187139000,  v14,  OS_LOG_TYPE_DEFAULT,  "[SIMULATE] DISPATCH: created simulate dispatch queue domain(%@.%@)",  buf,  0x16u);
      }
    }

    else
    {
      v15 = +[SUCoreDiag sharedDiag](&OBJC_CLASS___SUCoreDiag, "sharedDiag");
      [v15 trackError:@"[SIMULATE] DISPATCH" forReason:@"failed to create simulate dispatch queue" withResult:8100 withError:0];

      v2->_simulatorEnabled = 0;
    }
  }

  return v2;
}

- (void)adoptAllEventAlterations:(id)a3
{
  id v4 = a3;
  if (-[SUCoreSimulate simulatorEnabled](self, "simulatorEnabled"))
  {
    -[SUCoreSimulate simulateQueue](self, "simulateQueue");
    v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_not_V2(v5);

    -[SUCoreSimulate simulateQueue](self, "simulateQueue");
    v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __43__SUCoreSimulate_adoptAllEventAlterations___block_invoke;
    block[3] = &unk_189FE8FC0;
    block[4] = self;
    id v11 = v4;
    dispatch_sync(v6, block);
  }

  else
  {
    v7 = +[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger");
    [v7 oslog];
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl( &dword_187139000,  v8,  OS_LOG_TYPE_DEFAULT,  "[SIMULATE] cannot adopt event alterations (simulator disabled)",  v9,  2u);
    }

    NSLog((NSString *)@"[SIMULATE] cannot adopt event alterations (simulator disabled)");
  }
}

uint64_t __43__SUCoreSimulate_adoptAllEventAlterations___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _adoptAllEventAlterations:*(void *)(a1 + 40)];
}

- (void)_adoptAllEventAlterations:(id)a3
{
  uint64_t v47 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  -[SUCoreSimulate simulateQueue](self, "simulateQueue");
  v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);
  v6 = -[SUCoreSimulate eventAlterations](self, "eventAlterations");
  if (!v6)
  {
    [MEMORY[0x1896078A8] defaultManager];
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (![v8 fileExistsAtPath:v4])
    {
      v12 = +[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger");
      [v12 oslog];
      v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v45 = v4;
        _os_log_impl( &dword_187139000,  v13,  OS_LOG_TYPE_DEFAULT,  "[SIMULATE] simulate event alterations file does not exist (file non-existent): %@",  buf,  0xCu);
      }

      NSLog((NSString *)@"[SIMULATE] simulate event alterations file does not exist (file non-existent): %@", v4);
      goto LABEL_33;
    }

    id v38 = objc_alloc_init(MEMORY[0x189603FC8]);
    id v43 = 0LL;
    [NSString stringWithContentsOfFile:v4 encoding:1 error:&v43];
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    id v10 = v43;
    if (v10)
    {
      +[SUCoreDiag sharedDiag](&OBJC_CLASS___SUCoreDiag, "sharedDiag");
      id v11 = (id)objc_claimAutoreleasedReturnValue();
      [v11 trackError:@"[SIMULATE] SETUP" forReason:@"adopt event alterations (load failed)" withResult:8121 withError:v10];
LABEL_32:

LABEL_33:
      goto LABEL_34;
    }

    [MEMORY[0x189607810] characterSetWithCharactersInString:@"\r\n"];
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 componentsSeparatedByCharactersInSet:v14];
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    __int128 v41 = 0u;
    __int128 v42 = 0u;
    __int128 v39 = 0u;
    __int128 v40 = 0u;
    id v11 = v15;
    uint64_t v16 = [v11 countByEnumeratingWithState:&v39 objects:v46 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      v34 = v9;
      v35 = v8;
      id v36 = v4;
      uint64_t v18 = *(void *)v40;
      char v37 = 1;
      do
      {
        for (uint64_t i = 0LL; i != v17; ++i)
        {
          if (*(void *)v40 != v18) {
            objc_enumerationMutation(v11);
          }
          __int16 v20 = *(void **)(*((void *)&v39 + 1) + 8 * i);
          if ([v20 length])
          {
            objc_msgSend(v20, "substringWithRange:", 0, 1);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            char v22 = [v21 isEqualToString:@"#"];

            if ((v22 & 1) == 0)
            {
              v23 = -[SUCoreSimulate _eventFromLine:](self, "_eventFromLine:", v20);
              v24 = v23;
              if (v23)
              {
                [v23 moduleName];
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                [v38 safeObjectForKey:v25 ofClass:objc_opt_class()];
                id v26 = (id)objc_claimAutoreleasedReturnValue();

                if (!v26)
                {
                  id v26 = objc_alloc_init(MEMORY[0x189603FA8]);
                  [v24 moduleName];
                  v27 = (void *)objc_claimAutoreleasedReturnValue();
                  [v38 setSafeObject:v26 forKey:v27];
                }
                v28 = +[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger");
                [v28 oslog];
                v29 = (os_log_s *)objc_claimAutoreleasedReturnValue();

                if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
                {
                  [v24 summary];
                  v30 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412290;
                  id v45 = v30;
                  _os_log_impl(&dword_187139000, v29, OS_LOG_TYPE_DEFAULT, "[SIMULATE] adding event: %@", buf, 0xCu);
                }

                [v26 addObject:v24];
              }

              else
              {
                v31 = +[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger");
                [v31 oslog];
                v32 = (os_log_s *)objc_claimAutoreleasedReturnValue();

                if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  id v45 = v20;
                  _os_log_impl( &dword_187139000,  v32,  OS_LOG_TYPE_DEFAULT,  "[SIMULATE] failed parsing line: %@",  buf,  0xCu);
                }

                NSLog((NSString *)@"[SIMULATE] failed parsing line: %@", v20);
                char v37 = 0;
              }
            }
          }
        }

        uint64_t v17 = [v11 countByEnumeratingWithState:&v39 objects:v46 count:16];
      }

      while (v17);

      id v8 = v35;
      id v4 = v36;
      v9 = v34;
      if ((v37 & 1) == 0)
      {
        v33 = +[SUCoreDiag sharedDiag](&OBJC_CLASS___SUCoreDiag, "sharedDiag");
        [v33 trackError:@"[SIMULATE] SETUP" forReason:@"adopt event alterations (parsing failed)" withResult:8121 withError:0];

        goto LABEL_32;
      }
    }

    else
    {
    }

    -[SUCoreSimulate setEventAlterations:](self, "setEventAlterations:", v38);
    goto LABEL_32;
  }
  v7 = +[SUCoreDiag sharedDiag](&OBJC_CLASS___SUCoreDiag, "sharedDiag");
  [v7 trackError:@"[SIMULATE] SETUP" forReason:@"adopt event alterations (already adopted)" withResult:8111 withError:0];

LABEL_34:
}

- (id)_eventFromLine:(id)a3
{
  id v4 = a3;
  unsigned int v58 = -1;
  v59[0] = -1;
  int v57 = -1;
  uint64_t v55 = 0LL;
  uint64_t v56 = 0LL;
  [v4 componentsSeparatedByString:@"--"];
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ([v5 count])
  {
    [v5 objectAtIndexedSubscript:0];
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    [MEMORY[0x189607810] whitespaceAndNewlineCharacterSet];
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 stringByTrimmingCharactersInSet:v7];
    id v8 = (void *)objc_claimAutoreleasedReturnValue();

    [MEMORY[0x189607810] characterSetWithCharactersInString:@"\t "];
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 componentsSeparatedByCharactersInSet:v9];
    id v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    id v10 = 0LL;
  }

  if ((unint64_t)[v5 count] < 2)
  {
    v15 = 0LL;
    if (!v10) {
      goto LABEL_11;
    }
  }

  else
  {
    [v5 objectAtIndexedSubscript:1];
    id v11 = (void *)objc_claimAutoreleasedReturnValue();
    [MEMORY[0x189607810] whitespaceAndNewlineCharacterSet];
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v11 stringByTrimmingCharactersInSet:v12];
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    [MEMORY[0x189607810] characterSetWithCharactersInString:@"\t "];
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    [v13 componentsSeparatedByCharactersInSet:v14];
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10) {
      goto LABEL_11;
    }
  }

  if ((unint64_t)[v10 count] >= 2)
  {
    [v10 objectAtIndexedSubscript:0];
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
    int64_t v17 = -[SUCoreSimulate _actionFromString:](self, "_actionFromString:", v16);

    int64_t v18 = v17;
    [v10 objectAtIndexedSubscript:1];
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    int64_t v42 = -[SUCoreSimulate _triggerFromString:](self, "_triggerFromString:", v19);

    if (v15) {
      goto LABEL_12;
    }
LABEL_10:
    id v20 = 0LL;
    id v45 = 0LL;
    id v46 = 0LL;
    id v43 = 0LL;
    id v44 = 0LL;
    id v21 = 0LL;
    id v22 = 0LL;
    id v23 = 0LL;
    goto LABEL_13;
  }

- (id)_splitString:(id)a3 byTheFirstOccurrenceOf:(id)a4
{
  v12[2] = *MEMORY[0x1895F89C0];
  id v5 = a3;
  uint64_t v6 = [v5 rangeOfString:a4];
  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v7 = 0LL;
  }

  else
  {
    uint64_t v8 = v6;
    [v5 substringToIndex:v6];
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 substringFromIndex:v8 + 1];
    id v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v9;
    v12[1] = v10;
    [MEMORY[0x189603F18] arrayWithObjects:v12 count:2];
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (BOOL)_parseOptionalEntriesInLineFromWords:(id)a3 argStartAt:(int *)a4 argEndAt:(int *)a5 argDuration:(int *)a6 argUntilStop:(id *)a7 argAssetBuildVersions:(id *)a8 argAssetProductVersions:(id *)a9 argAssetAttributesPlist:(id *)a10 argAssetState:(id *)a11 argUpdateInfoPlist:(id *)a12 argErrorDomain:(id *)a13 argErrorCode:(int64_t *)a14 argErrorUserInfo:(id *)a15 argErrorRecoverable:(int64_t *)a16
{
  uint64_t v126 = *MEMORY[0x1895F89C0];
  __int128 v117 = 0u;
  __int128 v118 = 0u;
  __int128 v119 = 0u;
  __int128 v120 = 0u;
  id obj = a3;
  uint64_t v18 = [obj countByEnumeratingWithState:&v117 objects:v125 count:16];
  if (!v18)
  {
    BOOL v99 = 0;
    BOOL v98 = 0;
    id v97 = 0LL;
    id v96 = 0LL;
    char v20 = 1;
    goto LABEL_81;
  }

  uint64_t v19 = v18;
  v109 = a8;
  v110 = 0LL;
  v111 = 0LL;
  char v20 = 1;
  uint64_t v21 = *(void *)v118;
  do
  {
    uint64_t v22 = 0LL;
    do
    {
      if (*(void *)v118 != v21) {
        objc_enumerationMutation(obj);
      }
      id v23 = *(void **)(*((void *)&v117 + 1) + 8 * v22);
      -[SUCoreSimulate _splitString:byTheFirstOccurrenceOf:]( self,  "_splitString:byTheFirstOccurrenceOf:",  v23,  @"=");
      BOOL v24 = (void *)objc_claimAutoreleasedReturnValue();
      id v25 = v24;
      if (!v24 || [v24 count] != 2)
      {
        v32 = +[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger");
        [v32 oslog];
        v33 = (os_log_s *)objc_claimAutoreleasedReturnValue();

        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v122 = (uint64_t)v23;
          _os_log_impl( &dword_187139000,  v33,  OS_LOG_TYPE_DEFAULT,  "[SIMULATE] failed parsing tokens (unexpected format, expected 'key=value') for: '%@'",  buf,  0xCu);
        }

        NSLog( (NSString *)@"[SIMULATE] failed parsing tokens (unexpected format, expected 'key=value') for: '%@'",  v23);
        goto LABEL_16;
      }

      [v25 objectAtIndexedSubscript:0];
      id v26 = (void *)objc_claimAutoreleasedReturnValue();
      int v27 = [v26 isEqualToString:@"startAt"];

      if (v27)
      {
        [v25 objectAtIndexedSubscript:1];
        uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue();
        BOOL v29 = -[SUCoreSimulate _parseIntFromString:destination:](self, "_parseIntFromString:destination:", v28, a4);

        if (v29) {
          goto LABEL_17;
        }
        v30 = +[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger");
        [v30 oslog];
        v31 = (os_log_s *)objc_claimAutoreleasedReturnValue();

        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v122 = (uint64_t)v23;
          _os_log_impl( &dword_187139000,  v31,  OS_LOG_TYPE_DEFAULT,  "[SIMULATE] failed parsing 'startAt' (expected int) for: '%@'",  buf,  0xCu);
        }

        NSLog((NSString *)@"[SIMULATE] failed parsing 'startAt' (expected int) for: '%@'", v23);
        goto LABEL_16;
      }

      [v25 objectAtIndexedSubscript:0];
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      int v35 = [v34 isEqualToString:@"endAt"];

      if (v35)
      {
        [v25 objectAtIndexedSubscript:1];
        uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue();
        BOOL v37 = -[SUCoreSimulate _parseIntFromString:destination:](self, "_parseIntFromString:destination:", v36, a5);

        if (!v37)
        {
          +[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger");
          id v38 = (void *)objc_claimAutoreleasedReturnValue();
          [v38 oslog];
          int64_t v39 = (os_log_s *)objc_claimAutoreleasedReturnValue();

          if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v122 = (uint64_t)v23;
            _os_log_impl( &dword_187139000,  v39,  OS_LOG_TYPE_DEFAULT,  "[SIMULATE] failed parsing 'endAt' (expected int) for: '%@'",  buf,  0xCu);
          }

          NSLog((NSString *)@"[SIMULATE] failed parsing 'endAt' (expected int) for: '%@'", v23);
LABEL_16:
          char v20 = 0;
        }
      }

      else
      {
        [v25 objectAtIndexedSubscript:0];
        __int128 v40 = (void *)objc_claimAutoreleasedReturnValue();
        int v41 = [v40 isEqualToString:@"duration"];

        if (v41)
        {
          [v25 objectAtIndexedSubscript:1];
          int64_t v42 = (void *)objc_claimAutoreleasedReturnValue();
          BOOL v43 = -[SUCoreSimulate _parseIntFromString:destination:](self, "_parseIntFromString:destination:", v42, a6);

          if (!v43)
          {
            +[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger");
            id v44 = (void *)objc_claimAutoreleasedReturnValue();
            [v44 oslog];
            id v45 = (os_log_s *)objc_claimAutoreleasedReturnValue();

            if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v122 = (uint64_t)v23;
              _os_log_impl( &dword_187139000,  v45,  OS_LOG_TYPE_DEFAULT,  "[SIMULATE] failed parsing 'duration' (expected int) for: '%@'",  buf,  0xCu);
            }

            NSLog((NSString *)@"[SIMULATE] failed parsing 'duration' (expected int) for: '%@'", v23);
            goto LABEL_16;
          }
        }

        else
        {
          [v25 objectAtIndexedSubscript:0];
          id v46 = (void *)objc_claimAutoreleasedReturnValue();
          int v47 = [v46 isEqualToString:@"untilStop"];

          if (a7 && v47)
          {
            [v25 objectAtIndexedSubscript:1];
            *a7 = (id)objc_claimAutoreleasedReturnValue();
            goto LABEL_17;
          }

          [v25 objectAtIndexedSubscript:0];
          id v48 = (void *)objc_claimAutoreleasedReturnValue();
          int v49 = [v48 isEqualToString:@"assetBuildVersions"];

          if (v49)
          {
            [v25 objectAtIndexedSubscript:1];
            id v50 = (void *)objc_claimAutoreleasedReturnValue();
            uint64_t v51 = [v50 componentsSeparatedByString:@","];

            v111 = (void *)v51;
            goto LABEL_17;
          }

          [v25 objectAtIndexedSubscript:0];
          id v52 = (void *)objc_claimAutoreleasedReturnValue();
          int v53 = [v52 isEqualToString:@"assetProductVersions"];

          if (v53)
          {
            [v25 objectAtIndexedSubscript:1];
            id v54 = (void *)objc_claimAutoreleasedReturnValue();
            uint64_t v55 = [v54 componentsSeparatedByString:@","];

            v110 = (void *)v55;
            goto LABEL_17;
          }

          [v25 objectAtIndexedSubscript:0];
          uint64_t v56 = (void *)objc_claimAutoreleasedReturnValue();
          int v57 = [v56 isEqualToString:@"assetAttributesPlist"];

          if (a10 && v57)
          {
            [v25 objectAtIndexedSubscript:1];
            *a10 = (id)objc_claimAutoreleasedReturnValue();
            +[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger");
            unsigned int v58 = (void *)objc_claimAutoreleasedReturnValue();
            [v58 oslog];
            v59 = (os_log_s *)objc_claimAutoreleasedReturnValue();

            if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
            {
              id v60 = *a10;
              *(_DWORD *)buf = 138412290;
              uint64_t v122 = (uint64_t)v60;
              v61 = v59;
              v62 = "[SIMULATE] using assetAttributesPlist: '%@'";
              goto LABEL_52;
            }

- (BOOL)_parseIntFromString:(id)a3 destination:(int *)a4
{
  id v5 = (objc_class *)MEMORY[0x189607978];
  id v6 = a3;
  id v7 = objc_alloc_init(v5);
  [v7 numberFromString:v6];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8) {
    *a4 = [v8 intValue];
  }

  return v8 != 0LL;
}

- (BOOL)_parseErrorCodeFromString:(id)a3 destination:(int64_t *)a4
{
  id v5 = (objc_class *)MEMORY[0x189607978];
  id v6 = a3;
  id v7 = objc_alloc_init(v5);
  [v7 numberFromString:v6];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8) {
    *a4 = (int)[v8 intValue];
  }

  return v8 != 0LL;
}

- (BOOL)_parseEventBooleanFromString:(id)a3 destination:(int64_t *)a4
{
  id v5 = a3;
  if (([v5 isEqualToString:@"none"] & 1) != 0
    || ([v5 isEqualToString:@"NONE"] & 1) != 0)
  {
    int64_t v6 = 0LL;
  }

  else if (([v5 isEqualToString:@"true"] & 1) != 0 {
         || ([v5 isEqualToString:@"TRUE"] & 1) != 0
  }
         || ([v5 isEqualToString:@"t"] & 1) != 0
         || ([v5 isEqualToString:@"T"] & 1) != 0
         || ([v5 isEqualToString:@"yes"] & 1) != 0
         || ([v5 isEqualToString:@"YES"] & 1) != 0
         || ([v5 isEqualToString:@"y"] & 1) != 0
         || ([v5 isEqualToString:@"Y"] & 1) != 0)
  {
    int64_t v6 = 2LL;
  }

  else
  {
    if (([v5 isEqualToString:@"false"] & 1) == 0
      && ([v5 isEqualToString:@"FALSE"] & 1) == 0
      && ([v5 isEqualToString:@"f"] & 1) == 0
      && ([v5 isEqualToString:@"F"] & 1) == 0
      && ([v5 isEqualToString:@"no"] & 1) == 0
      && ([v5 isEqualToString:@"NO"] & 1) == 0
      && ([v5 isEqualToString:@"n"] & 1) == 0
      && ![v5 isEqualToString:@"N"])
    {
      BOOL v7 = 0;
      goto LABEL_14;
    }

    int64_t v6 = 1LL;
  }

  *a4 = v6;
  BOOL v7 = 1;
LABEL_14:

  return v7;
}

- (BOOL)_parseDictionaryFromString:(id)a3 destination:(id *)a4
{
  uint64_t v30 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  BOOL v24 = v5;
  if (a4)
  {
    [v5 propertyListFromStringsFileFormat];
    int64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    [MEMORY[0x189603FC8] dictionaryWithDictionary:v6];
    BOOL v7 = (void *)objc_claimAutoreleasedReturnValue();
    id v23 = a4;
    id v8 = objc_alloc_init(MEMORY[0x189607978]);
    [v8 setNumberStyle:1];
    __int128 v27 = 0u;
    __int128 v28 = 0u;
    __int128 v25 = 0u;
    __int128 v26 = 0u;
    id v9 = v6;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v26;
      v12 = (void *)MEMORY[0x189604A88];
      do
      {
        for (uint64_t i = 0LL; i != v10; ++i)
        {
          if (*(void *)v26 != v11) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void *)(*((void *)&v25 + 1) + 8 * i);
          [v9 valueForKey:v14];
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          [v8 numberFromString:v15];
          uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
          int64_t v17 = v16;
          if (v16
            || (v18 = [v15 isEqualToString:@"YES"], int64_t v17 = v12, (v18 & 1) != 0)
            || (v19 = [v15 isEqualToString:@"NO"], int64_t v17 = (void *)MEMORY[0x189604A80], v19))
          {
            [v7 setValue:v17 forKey:v14];
          }
        }

        uint64_t v10 = [v9 countByEnumeratingWithState:&v25 objects:v29 count:16];
      }

      while (v10);
    }

    id v20 = v7;
    id *v23 = v20;

    BOOL v21 = 1;
  }

  else
  {
    BOOL v21 = 0;
  }

  return v21;
}

- (int64_t)_actionFromString:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"error"])
  {
    int64_t v4 = 1LL;
  }

  else if ([v3 isEqualToString:@"fault"])
  {
    int64_t v4 = 2LL;
  }

  else if ([v3 isEqualToString:@"success"])
  {
    int64_t v4 = 3LL;
  }

  else if ([v3 isEqualToString:@"exit"])
  {
    int64_t v4 = 4LL;
  }

  else if ([v3 isEqualToString:@"spin"])
  {
    int64_t v4 = 5LL;
  }

  else if ([v3 isEqualToString:@"hang"])
  {
    int64_t v4 = 6LL;
  }

  else if ([v3 isEqualToString:@"wait"])
  {
    int64_t v4 = 7LL;
  }

  else if ([v3 isEqualToString:@"pause"])
  {
    int64_t v4 = 8LL;
  }

  else if ([v3 isEqualToString:@"replace_action"])
  {
    int64_t v4 = 9LL;
  }

  else if ([v3 isEqualToString:@"replace_event"])
  {
    int64_t v4 = 10LL;
  }

  else if ([v3 isEqualToString:@"modify_param"])
  {
    int64_t v4 = 11LL;
  }

  else
  {
    int64_t v4 = 0LL;
  }

  return v4;
}

- (int64_t)_triggerFromString:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"begin"])
  {
    int64_t v4 = 1LL;
  }

  else if ([v3 isEqualToString:@"end"])
  {
    int64_t v4 = 2LL;
  }

  else if ([v3 isEqualToString:@"fsm"])
  {
    int64_t v4 = 3LL;
  }

  else
  {
    int64_t v4 = 0LL;
  }

  return v4;
}

- (void)clearAllEventAlterations
{
  if (-[SUCoreSimulate simulatorEnabled](self, "simulatorEnabled"))
  {
    -[SUCoreSimulate simulateQueue](self, "simulateQueue");
    id v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_not_V2(v3);

    -[SUCoreSimulate simulateQueue](self, "simulateQueue");
    int64_t v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __42__SUCoreSimulate_clearAllEventAlterations__block_invoke;
    block[3] = &unk_189FE8FE8;
    block[4] = self;
    dispatch_sync(v4, block);
  }

  else
  {
    +[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger");
    id v5 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 oslog];
    int64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)BOOL v7 = 0;
      _os_log_impl( &dword_187139000,  v6,  OS_LOG_TYPE_DEFAULT,  "[SIMULATE] cannot clear events (simulator disabled)",  v7,  2u);
    }

    NSLog((NSString *)@"[SIMULATE] cannot clear events (simulator disabled)");
  }

uint64_t __42__SUCoreSimulate_clearAllEventAlterations__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setLastAlteration:0];
}

- (void)dumpAllEventAlterations
{
  if (-[SUCoreSimulate simulatorEnabled](self, "simulatorEnabled"))
  {
    -[SUCoreSimulate simulateQueue](self, "simulateQueue");
    id v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_not_V2(v3);

    -[SUCoreSimulate simulateQueue](self, "simulateQueue");
    int64_t v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __41__SUCoreSimulate_dumpAllEventAlterations__block_invoke;
    block[3] = &unk_189FE8FE8;
    block[4] = self;
    dispatch_sync(v4, block);
  }

  else
  {
    +[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger");
    id v5 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 oslog];
    int64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)BOOL v7 = 0;
      _os_log_impl( &dword_187139000,  v6,  OS_LOG_TYPE_DEFAULT,  "[SIMULATE] cannot dump events (simulator disabled)",  v7,  2u);
    }

    NSLog((NSString *)@"[SIMULATE] cannot dump events (simulator disabled)");
  }

uint64_t __41__SUCoreSimulate_dumpAllEventAlterations__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _dumpAllEventAlterations];
}

- (void)_dumpAllEventAlterations
{
  uint64_t v41 = *MEMORY[0x1895F89C0];
  -[SUCoreSimulate simulateQueue](self, "simulateQueue");
  id v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[SUCoreSimulate eventAlterations](self, "eventAlterations");
  int64_t v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[SUCoreSimulate eventAlterations](self, "eventAlterations");
    id v5 = (void *)objc_claimAutoreleasedReturnValue();
    int64_t v6 = v5;
    if (v5)
    {
      __int128 v35 = 0u;
      __int128 v36 = 0u;
      __int128 v33 = 0u;
      __int128 v34 = 0u;
      uint64_t v27 = [v5 countByEnumeratingWithState:&v33 objects:v40 count:16];
      if (v27)
      {
        char v7 = 0;
        uint64_t v26 = *(void *)v34;
        __int128 v25 = v6;
        do
        {
          for (uint64_t i = 0LL; i != v27; ++i)
          {
            if (*(void *)v34 != v26) {
              objc_enumerationMutation(v6);
            }
            [v6 safeObjectForKey:*(void *)(*((void *)&v33 + 1) + 8 * i) ofClass:objc_opt_class()];
            id v9 = (void *)objc_claimAutoreleasedReturnValue();
            __int128 v29 = 0u;
            __int128 v30 = 0u;
            __int128 v31 = 0u;
            __int128 v32 = 0u;
            uint64_t v10 = [v9 countByEnumeratingWithState:&v29 objects:v39 count:16];
            if (v10)
            {
              uint64_t v11 = v10;
              uint64_t v28 = i;
              uint64_t v12 = *(void *)v30;
              do
              {
                for (uint64_t j = 0LL; j != v11; ++j)
                {
                  if (*(void *)v30 != v12) {
                    objc_enumerationMutation(v9);
                  }
                  uint64_t v14 = *(void **)(*((void *)&v29 + 1) + 8 * j);
                  v15 = +[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger");
                  [v15 oslog];
                  uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();

                  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
                  {
                    [v14 summary];
                    int64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138412290;
                    id v38 = v17;
                    _os_log_impl( &dword_187139000,  v16,  OS_LOG_TYPE_DEFAULT,  "[SIMULATE] dump all events - %@",  buf,  0xCu);
                  }

                  [v14 summary];
                  char v18 = (void *)objc_claimAutoreleasedReturnValue();
                  NSLog((NSString *)@"[SIMULATE] dump all events - %@", v18);
                }

                uint64_t v11 = [v9 countByEnumeratingWithState:&v29 objects:v39 count:16];
              }

              while (v11);
              char v7 = 1;
              int64_t v6 = v25;
              uint64_t i = v28;
            }
          }

          uint64_t v27 = [v6 countByEnumeratingWithState:&v33 objects:v40 count:16];
        }

        while (v27);
        if ((v7 & 1) != 0) {
          goto LABEL_31;
        }
      }

      +[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger");
      int v19 = (void *)objc_claimAutoreleasedReturnValue();
      [v19 oslog];
      id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( &dword_187139000,  v20,  OS_LOG_TYPE_DEFAULT,  "[SIMULATE] dump all events - empty simulate events",  buf,  2u);
      }

      BOOL v21 = @"[SIMULATE] dump all events - empty simulate events";
    }

    else
    {
      +[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger");
      BOOL v24 = (void *)objc_claimAutoreleasedReturnValue();
      [v24 oslog];
      id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( &dword_187139000,  v20,  OS_LOG_TYPE_DEFAULT,  "[SIMULATE] dump all events - no simulate events",  buf,  2u);
      }

      BOOL v21 = @"[SIMULATE] dump all events - no simulate events";
    }

    NSLog((NSString *)v21);
LABEL_31:

    return;
  }

  +[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger");
  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
  [v22 oslog];
  id v23 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( &dword_187139000,  v23,  OS_LOG_TYPE_DEFAULT,  "[SIMULATE] cannot dump events (no persisted state)",  buf,  2u);
  }

  NSLog((NSString *)@"[SIMULATE] cannot dump events (no persisted state)");
}

- (int)countOfAlterationsPerformed
{
  uint64_t v11 = 0LL;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000LL;
  int v14 = 0;
  if (-[SUCoreSimulate simulatorEnabled](self, "simulatorEnabled"))
  {
    -[SUCoreSimulate simulateQueue](self, "simulateQueue");
    id v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_not_V2(v3);

    -[SUCoreSimulate simulateQueue](self, "simulateQueue");
    int64_t v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __45__SUCoreSimulate_countOfAlterationsPerformed__block_invoke;
    block[3] = &unk_189FE9010;
    block[4] = self;
    void block[5] = &v11;
    dispatch_sync(v4, block);
  }

  else
  {
    +[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger");
    id v5 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 oslog];
    int64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v9 = 0;
      _os_log_impl( &dword_187139000,  v6,  OS_LOG_TYPE_DEFAULT,  "[SIMULATE] cannot provide count of alterations (simulator disabled)",  v9,  2u);
    }

    NSLog((NSString *)@"[SIMULATE] cannot provide count of alterations (simulator disabled)");
  }

  int v7 = *((_DWORD *)v12 + 6);
  _Block_object_dispose(&v11, 8);
  return v7;
}

uint64_t __45__SUCoreSimulate_countOfAlterationsPerformed__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) alterationsPerformed];
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = result;
  return result;
}

- (id)lastAlterationPerformed
{
  uint64_t v11 = 0LL;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000LL;
  int v14 = __Block_byref_object_copy_;
  v15 = __Block_byref_object_dispose_;
  id v16 = 0LL;
  if (-[SUCoreSimulate simulatorEnabled](self, "simulatorEnabled"))
  {
    -[SUCoreSimulate simulateQueue](self, "simulateQueue");
    id v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_not_V2(v3);

    -[SUCoreSimulate simulateQueue](self, "simulateQueue");
    int64_t v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __41__SUCoreSimulate_lastAlterationPerformed__block_invoke;
    block[3] = &unk_189FE9010;
    block[4] = self;
    void block[5] = &v11;
    dispatch_sync(v4, block);
  }

  else
  {
    +[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger");
    id v5 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 oslog];
    int64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v9 = 0;
      _os_log_impl( &dword_187139000,  v6,  OS_LOG_TYPE_DEFAULT,  "[SIMULATE] cannot provide last alterations (simulator disabled)",  v9,  2u);
    }

    NSLog((NSString *)@"[SIMULATE] cannot provide last alterations (simulator disabled)");
  }

  id v7 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return v7;
}

void __41__SUCoreSimulate_lastAlterationPerformed__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) lastAlteration];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8LL);
  int64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)begin:(id)a3 atFunction:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v22 = 0LL;
  id v23 = &v22;
  uint64_t v24 = 0x3032000000LL;
  __int128 v25 = __Block_byref_object_copy_;
  uint64_t v26 = __Block_byref_object_dispose_;
  id v27 = 0LL;
  if (-[SUCoreSimulate simulatorEnabled](self, "simulatorEnabled"))
  {
    -[SUCoreSimulate simulateQueue](self, "simulateQueue");
    id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_not_V2(v8);

    -[SUCoreSimulate simulateQueue](self, "simulateQueue");
    id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    uint64_t v14 = MEMORY[0x1895F87A8];
    uint64_t v15 = 3221225472LL;
    id v16 = __35__SUCoreSimulate_begin_atFunction___block_invoke;
    int64_t v17 = &unk_189FE9038;
    BOOL v21 = &v22;
    char v18 = self;
    id v19 = v6;
    id v20 = v7;
    dispatch_sync(v9, &v14);

    uint64_t v10 = -[SUCoreSimulate _performOffQueueEvent:](self, "_performOffQueueEvent:", v23[5], v14, v15, v16, v17, v18);
    uint64_t v11 = (void *)v23[5];
    v23[5] = v10;
  }

  id v12 = (id)v23[5];
  _Block_object_dispose(&v22, 8);

  return v12;
}

void __35__SUCoreSimulate_begin_atFunction___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _locateEventForModule:*(void *)(a1 + 40) forIdentity:*(void *)(a1 + 48) withTrigger:1 forEvent:0 inState:0];
  uint64_t v3 = *(void *)(*(void *)(a1 + 56) + 8LL);
  int64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  if (!*(void *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 40LL)
    && ([*(id *)(a1 + 40) isEqualToString:@"*"] & 1) == 0)
  {
    uint64_t v5 = [*(id *)(a1 + 32) _locateEventForModule:@"*" forIdentity:*(void *)(a1 + 48) withTrigger:1 forEvent:0 inState:0];
    uint64_t v6 = *(void *)(*(void *)(a1 + 56) + 8LL);
    id v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;
  }

- (id)end:(id)a3 atFunction:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v22 = 0LL;
  id v23 = &v22;
  uint64_t v24 = 0x3032000000LL;
  __int128 v25 = __Block_byref_object_copy_;
  uint64_t v26 = __Block_byref_object_dispose_;
  id v27 = 0LL;
  if (-[SUCoreSimulate simulatorEnabled](self, "simulatorEnabled"))
  {
    -[SUCoreSimulate simulateQueue](self, "simulateQueue");
    id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_not_V2(v8);

    -[SUCoreSimulate simulateQueue](self, "simulateQueue");
    id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    uint64_t v14 = MEMORY[0x1895F87A8];
    uint64_t v15 = 3221225472LL;
    id v16 = __33__SUCoreSimulate_end_atFunction___block_invoke;
    int64_t v17 = &unk_189FE9038;
    BOOL v21 = &v22;
    char v18 = self;
    id v19 = v6;
    id v20 = v7;
    dispatch_sync(v9, &v14);

    uint64_t v10 = -[SUCoreSimulate _performOffQueueEvent:](self, "_performOffQueueEvent:", v23[5], v14, v15, v16, v17, v18);
    uint64_t v11 = (void *)v23[5];
    v23[5] = v10;
  }

  id v12 = (id)v23[5];
  _Block_object_dispose(&v22, 8);

  return v12;
}

void __33__SUCoreSimulate_end_atFunction___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _locateEventForModule:*(void *)(a1 + 40) forIdentity:*(void *)(a1 + 48) withTrigger:2 forEvent:0 inState:0];
  uint64_t v3 = *(void *)(*(void *)(a1 + 56) + 8LL);
  int64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  if (!*(void *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 40LL)
    && ([*(id *)(a1 + 40) isEqualToString:@"*"] & 1) == 0)
  {
    uint64_t v5 = [*(id *)(a1 + 32) _locateEventForModule:@"*" forIdentity:*(void *)(a1 + 48) withTrigger:2 forEvent:0 inState:0];
    uint64_t v6 = *(void *)(*(void *)(a1 + 56) + 8LL);
    id v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;
  }

- (id)fsm:(id)a3 forEvent:(id)a4 inState:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v22 = 0LL;
  id v23 = &v22;
  uint64_t v24 = 0x3032000000LL;
  __int128 v25 = __Block_byref_object_copy_;
  uint64_t v26 = __Block_byref_object_dispose_;
  id v27 = 0LL;
  if (-[SUCoreSimulate simulatorEnabled](self, "simulatorEnabled"))
  {
    -[SUCoreSimulate simulateQueue](self, "simulateQueue");
    uint64_t v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_not_V2(v11);

    -[SUCoreSimulate simulateQueue](self, "simulateQueue");
    id v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __39__SUCoreSimulate_fsm_forEvent_inState___block_invoke;
    block[3] = &unk_189FE9060;
    BOOL v21 = &v22;
    block[4] = self;
    id v18 = v8;
    id v19 = v9;
    id v20 = v10;
    dispatch_sync(v12, block);

    uint64_t v13 = -[SUCoreSimulate _performOffQueueEvent:](self, "_performOffQueueEvent:", v23[5]);
    uint64_t v14 = (void *)v23[5];
    v23[5] = v13;
  }

  id v15 = (id)v23[5];
  _Block_object_dispose(&v22, 8);

  return v15;
}

void __39__SUCoreSimulate_fsm_forEvent_inState___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _locateEventForModule:@"fsm" forIdentity:*(void *)(a1 + 40) withTrigger:3 forEvent:*(void *)(a1 + 48) inState:*(void *)(a1 + 56)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 64) + 8LL);
  int64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)generateError:(id)a3 ofDomain:(id)a4 withCode:(int64_t)a5
{
  id v7 = (objc_class *)MEMORY[0x189603FC8];
  id v8 = a4;
  id v9 = a3;
  id v10 = objc_alloc_init(v7);
  uint64_t v11 = (void *)[objc_alloc(NSString) initWithFormat:@"[SIMULATED_ERROR] created by %@ (for domain=%@, code=%ld)", v9, v8, a5];

  [v10 setSafeObject:v11 forKey:*MEMORY[0x1896075E0]];
  [MEMORY[0x189607870] errorWithDomain:v8 code:a5 userInfo:v10];
  id v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)_locateEventForModule:(id)a3 forIdentity:(id)a4 withTrigger:(int64_t)a5 forEvent:(id)a6 inState:(id)a7
{
  uint64_t v47 = *MEMORY[0x1895F89C0];
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  id v39 = a7;
  -[SUCoreSimulate simulateQueue](self, "simulateQueue");
  uint64_t v14 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v14);

  -[SUCoreSimulate eventAlterations](self, "eventAlterations");
  id v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15) {
    goto LABEL_30;
  }
  BOOL v37 = self;
  -[SUCoreSimulate eventAlterations](self, "eventAlterations");
  id v16 = (void *)objc_claimAutoreleasedReturnValue();
  [v16 safeObjectForKey:v11 ofClass:objc_opt_class()];
  int64_t v17 = (void *)objc_claimAutoreleasedReturnValue();

  __int128 v44 = 0u;
  __int128 v45 = 0u;
  __int128 v42 = 0u;
  __int128 v43 = 0u;
  id v18 = v17;
  uint64_t v19 = [v18 countByEnumeratingWithState:&v42 objects:v46 count:16];
  if (!v19)
  {

LABEL_30:
    __int128 v33 = 0LL;
    goto LABEL_31;
  }

  uint64_t v20 = v19;
  id v36 = v11;
  id v40 = 0LL;
  id v41 = v18;
  uint64_t v21 = *(void *)v43;
  uint64_t v22 = v37;
  int64_t v23 = a5;
  do
  {
    uint64_t v24 = 0LL;
    do
    {
      if (*(void *)v43 != v21) {
        objc_enumerationMutation(v18);
      }
      __int128 v25 = *(void **)(*((void *)&v42 + 1) + 8 * v24);
      objc_msgSend(v25, "identityName", v36);
      uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue();
      int v27 = [v26 isEqualToString:v12];
      if (!v13)
      {
        if (!v27) {
          goto LABEL_19;
        }
        uint64_t v31 = [v25 simTrigger];

        if (v31 == v23)
        {
          objc_msgSend(v25, "setCount:", objc_msgSend(v25, "count") + 1);
          id v18 = v41;
          if (!-[SUCoreSimulate _isValidEvent:](v22, "_isValidEvent:", v25)) {
            goto LABEL_20;
          }
          uint64_t v26 = v40;
          id v40 = v25;
          goto LABEL_19;
        }

        goto LABEL_23;
      }

      if (!v27 || [v25 simTrigger] != v23) {
        goto LABEL_19;
      }
      [v25 fsmEvent];
      uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue();
      if (([v28 isEqualToString:v13] & 1) == 0)
      {

        id v18 = v41;
        goto LABEL_19;
      }

      [v25 fsmState];
      __int128 v29 = (void *)objc_claimAutoreleasedReturnValue();
      int v30 = [v29 isEqualToString:v39];

      if (!v30)
      {
        uint64_t v22 = v37;
        int64_t v23 = a5;
LABEL_23:
        id v18 = v41;
        goto LABEL_20;
      }

      objc_msgSend(v25, "setCount:", objc_msgSend(v25, "count") + 1);
      uint64_t v22 = v37;
      id v18 = v41;
      if (-[SUCoreSimulate _isValidEvent:](v37, "_isValidEvent:", v25))
      {
        uint64_t v26 = v40;
        id v40 = v25;
        int64_t v23 = a5;
LABEL_19:

        goto LABEL_20;
      }

      int64_t v23 = a5;
LABEL_20:
      ++v24;
    }

    while (v20 != v24);
    uint64_t v32 = [v18 countByEnumeratingWithState:&v42 objects:v46 count:16];
    uint64_t v20 = v32;
  }

  while (v32);

  __int128 v33 = v40;
  if (v40)
  {
    id v11 = v36;
    if (-[SUCoreSimulate _isImmediateEvent:](v22, "_isImmediateEvent:", v40))
    {
      uint64_t v34 = -[SUCoreSimulate _performSimulatedEventAlteration:](v22, "_performSimulatedEventAlteration:", v40);

      __int128 v33 = (void *)v34;
    }

    else
    {
      -[SUCoreSimulate _triggerOffQueueAlteration:](v22, "_triggerOffQueueAlteration:", v40);
    }
  }

  else
  {
    id v11 = v36;
  }

- (BOOL)_isValidEvent:(id)a3
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  id v3 = a3;
  int64_t v4 = v3;
  if (v3)
  {
    if ([v3 startAt] == -1)
    {
      BOOL v6 = 1;
    }

    else
    {
      int v5 = [v4 count];
      BOOL v6 = v5 >= (int)[v4 startAt];
    }

    if ([v4 endAt] != -1)
    {
      int v7 = [v4 count];
    }
  }

  else
  {
    BOOL v6 = 0;
  }

  +[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger");
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 oslog];
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = [v4 summary];
    id v11 = (void *)v10;
    if (v6) {
      id v12 = @"YES";
    }
    else {
      id v12 = @"NO";
    }
    *(_DWORD *)buf = 138412546;
    uint64_t v18 = v10;
    __int16 v19 = 2112;
    uint64_t v20 = v12;
    _os_log_impl(&dword_187139000, v9, OS_LOG_TYPE_DEFAULT, "[SIMULATE] located event: %@ | valid=%@", buf, 0x16u);
  }

  uint64_t v13 = [v4 summary];
  uint64_t v14 = (void *)v13;
  if (v6) {
    id v15 = @"YES";
  }
  else {
    id v15 = @"NO";
  }
  NSLog((NSString *)@"[SIMULATE] located event: %@ | valid=%@", v13, v15);

  return v6;
}

- (BOOL)_isImmediateEvent:(id)a3
{
  id v4 = a3;
  -[SUCoreSimulate simulateQueue](self, "simulateQueue");
  int v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  [v4 untilStop];
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6) {
    goto LABEL_6;
  }
  unint64_t v7 = [v4 simAction];
  if (v7 >= 0xC)
  {
    +[SUCoreDiag sharedDiag](&OBJC_CLASS___SUCoreDiag, "sharedDiag");
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    id v10 = objc_alloc(NSString);
    [v4 summary];
    id v11 = (void *)objc_claimAutoreleasedReturnValue();
    id v12 = (void *)[v10 initWithFormat:@"unknown simulate action: %@", v11];
    [v9 trackError:@"[SIMULATE] PERFORM" forReason:v12 withResult:8113 withError:0];

LABEL_6:
    LOBYTE(v8) = 0;
    goto LABEL_7;
  }

  unsigned int v8 = (0xE1Fu >> v7) & 1;
LABEL_7:

  return v8;
}

- (id)_performSimulatedEventAlteration:(id)a3
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  -[SUCoreSimulate simulateQueue](self, "simulateQueue");
  int v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  switch([v4 simAction])
  {
    case 0LL:
      +[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger");
      id v16 = (void *)objc_claimAutoreleasedReturnValue();
      [v16 oslog];
      BOOL v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        [v4 summary];
        int64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        int64_t v23 = v17;
        _os_log_impl( &dword_187139000,  v6,  OS_LOG_TYPE_DEFAULT,  "[SIMULATE] PERFORM - no simulated action: %@",  buf,  0xCu);
      }

      goto LABEL_13;
    case 1LL:
    case 3LL:
    case 9LL:
    case 10LL:
      -[SUCoreSimulate _performingAlteration:](self, "_performingAlteration:", v4);
      id v13 = v4;
      goto LABEL_15;
    case 2LL:
      -[SUCoreSimulate _performingAlteration:](self, "_performingAlteration:", v4);
      +[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger");
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
      [v18 oslog];
      __int16 v19 = (os_log_s *)objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT)) {
        -[SUCoreSimulate _performSimulatedEventAlteration:].cold.1(self, v4, v19);
      }

      goto LABEL_14;
    case 4LL:
      -[SUCoreSimulate _performingAlteration:](self, "_performingAlteration:", v4);
      exit(9900);
    case 5LL:
    case 6LL:
    case 7LL:
    case 8LL:
      +[SUCoreDiag sharedDiag](&OBJC_CLASS___SUCoreDiag, "sharedDiag");
      BOOL v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      id v7 = objc_alloc(NSString);
      [v4 summary];
      unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue();
      id v9 = (void *)[v7 initWithFormat:@"should be off-queue when performing simulate action: %@", v8];
      id v10 = v6;
      id v11 = v9;
      uint64_t v12 = 8117LL;
      goto LABEL_12;
    case 11LL:
      +[SUCoreDiag sharedDiag](&OBJC_CLASS___SUCoreDiag, "sharedDiag");
      BOOL v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      id v20 = objc_alloc(NSString);
      [v4 summary];
      unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v15 = [v20 initWithFormat:@"modify param not yet supported: %@", v8];
      goto LABEL_11;
    default:
      +[SUCoreDiag sharedDiag](&OBJC_CLASS___SUCoreDiag, "sharedDiag");
      BOOL v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      id v14 = objc_alloc(NSString);
      [v4 summary];
      unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v15 = [v14 initWithFormat:@"unknown simulate action: %@", v8];
LABEL_11:
      id v9 = (void *)v15;
      id v10 = v6;
      id v11 = v9;
      uint64_t v12 = 8113LL;
LABEL_12:
      -[os_log_s trackError:forReason:withResult:withError:]( v10,  "trackError:forReason:withResult:withError:",  @"[SIMULATE] PERFORM",  v11,  v12,  0LL);

LABEL_13:
LABEL_14:
      id v13 = 0LL;
LABEL_15:

      return v13;
  }

- (id)_performOffQueueEvent:(id)a3
{
  v56[4] = *MEMORY[0x1895F89C0];
  id v4 = a3;
  -[SUCoreSimulate simulateQueue](self, "simulateQueue");
  int v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v5);

  if (!v4) {
    goto LABEL_37;
  }
  [v4 untilStop];
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    uint64_t v7 = *MEMORY[0x189607538];
    uint64_t v8 = *MEMORY[0x189607500];
    v55[0] = *MEMORY[0x189607530];
    v55[1] = v8;
    v56[0] = v7;
    v56[1] = &unk_189FF8BB8;
    uint64_t v9 = *MEMORY[0x1896074D0];
    v55[2] = *MEMORY[0x1896074F0];
    v55[3] = v9;
    v56[2] = @"root";
    v56[3] = @"wheel";
    [MEMORY[0x189603F68] dictionaryWithObjects:v56 forKeys:v55 count:4];
    id v10 = (void *)objc_claimAutoreleasedReturnValue();
    [MEMORY[0x1896078A8] defaultManager];
    id v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 untilStop];
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 summary];
    id v13 = (void *)objc_claimAutoreleasedReturnValue();
    [v13 dataUsingEncoding:4];
    id v14 = (void *)objc_claimAutoreleasedReturnValue();
    int v15 = [v11 createFileAtPath:v12 contents:v14 attributes:v10];

    if (v15)
    {
      id v16 = (void *)NSString;
      dispatch_get_current_queue();
      int64_t v17 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
      [v16 stringWithUTF8String:dispatch_queue_get_label(v17)];
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();

      +[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger");
      __int16 v19 = (void *)objc_claimAutoreleasedReturnValue();
      [v19 oslog];
      id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        [v4 untilStop];
        uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        *(void *)id v54 = v21;
        *(_WORD *)&v54[8] = 2112;
        *(void *)&v54[10] = v18;
        _os_log_impl( &dword_187139000,  v20,  OS_LOG_TYPE_DEFAULT,  "[SIMULATE] PERFORM(OFF_QUEUE) - pausing until stop file(%@) has been deleted (running on queue %@)...",  buf,  0x16u);
      }

      [MEMORY[0x1896078A8] defaultManager];
      uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
      [v4 untilStop];
      int64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
      int v24 = [v22 fileExistsAtPath:v23];

      if (v24)
      {
        do
        {
          sleep(1u);
          [MEMORY[0x1896078A8] defaultManager];
          __int128 v25 = (void *)objc_claimAutoreleasedReturnValue();
          [v4 untilStop];
          uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue();
          char v27 = [v25 fileExistsAtPath:v26];
        }

        while ((v27 & 1) != 0);
      }

      +[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger");
      uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue();
      [v28 oslog];
      __int128 v29 = (os_log_s *)objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        [v4 untilStop];
        int v30 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        *(void *)id v54 = v30;
        _os_log_impl( &dword_187139000,  v29,  OS_LOG_TYPE_DEFAULT,  "[SIMULATE] PERFORM(OFF_QUEUE) - ...pausing [stop file(%@) has been deleted]",  buf,  0xCu);
      }
    }

    else
    {
      +[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger");
      uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue();
      [v31 oslog];
      uint64_t v32 = (os_log_s *)objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        [v4 untilStop];
        __int128 v33 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        *(void *)id v54 = v33;
        _os_log_impl( &dword_187139000,  v32,  OS_LOG_TYPE_DEFAULT,  "[SIMULATE] PERFORM(OFF_QUEUE) - unable to create stop file(%@)",  buf,  0xCu);
      }

      [v4 untilStop];
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
      NSLog((NSString *)@"[SIMULATE] PERFORM(OFF_QUEUE) - unable to create stop file(%@)", v18);
    }
  }

  [v4 untilStop];
  __int128 v35 = (void *)objc_claimAutoreleasedReturnValue();
  if (v35)
  {
LABEL_28:

    goto LABEL_29;
  }

  if ([v4 simAction] == 8)
  {
LABEL_16:
    else {
      unsigned int v34 = [v4 duration];
    }
    +[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger");
    id v36 = (void *)objc_claimAutoreleasedReturnValue();
    [v36 oslog];
    BOOL v37 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      id v38 = @"s";
      if (v34 == 1) {
        id v38 = &stru_189FEB358;
      }
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)id v54 = v34;
      *(_WORD *)&v54[4] = 2112;
      *(void *)&v54[6] = v38;
      _os_log_impl( &dword_187139000,  v37,  OS_LOG_TYPE_DEFAULT,  "[SIMULATE] PERFORM(OFF_QUEUE) - sleeping for %d second%@...",  buf,  0x12u);
    }

    sleep(v34);
    +[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger");
    id v39 = (void *)objc_claimAutoreleasedReturnValue();
    [v39 oslog];
    __int128 v35 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled((os_log_t)v35, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( &dword_187139000,  (os_log_t)v35,  OS_LOG_TYPE_DEFAULT,  "[SIMULATE] PERFORM(OFF_QUEUE) - ...sleeping",  buf,  2u);
    }

    goto LABEL_28;
  }

- (void)_performingAlteration:(id)a3
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  -[SUCoreSimulate simulateQueue](self, "simulateQueue");
  int v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[SUCoreSimulate setAlterationsPerformed:]( self,  "setAlterationsPerformed:",  -[SUCoreSimulate alterationsPerformed](self, "alterationsPerformed") + 1);
  -[SUCoreSimulate setLastAlteration:](self, "setLastAlteration:", v4);
  +[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger");
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 oslog];
  uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = -[SUCoreSimulate alterationsPerformed](self, "alterationsPerformed");
    [v4 summary];
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = 67109378;
    v10[1] = v8;
    __int16 v11 = 2112;
    uint64_t v12 = v9;
    _os_log_impl(&dword_187139000, v7, OS_LOG_TYPE_DEFAULT, "[SIMULATE] PERFORM #%d - %@", (uint8_t *)v10, 0x12u);
  }
}

- (void)_triggerOffQueueAlteration:(id)a3
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  -[SUCoreSimulate simulateQueue](self, "simulateQueue");
  int v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[SUCoreSimulate setAlterationsPerformed:]( self,  "setAlterationsPerformed:",  -[SUCoreSimulate alterationsPerformed](self, "alterationsPerformed") + 1);
  -[SUCoreSimulate setLastAlteration:](self, "setLastAlteration:", v4);
  +[SUCoreLog sharedLogger](&OBJC_CLASS___SUCoreLog, "sharedLogger");
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 oslog];
  uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = -[SUCoreSimulate alterationsPerformed](self, "alterationsPerformed");
    [v4 summary];
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = 67109378;
    v10[1] = v8;
    __int16 v11 = 2112;
    uint64_t v12 = v9;
    _os_log_impl(&dword_187139000, v7, OS_LOG_TYPE_DEFAULT, "[SIMULATE] TRIGGER #%d - %@", (uint8_t *)v10, 0x12u);
  }
}

- (int)alterationsPerformed
{
  return self->_alterationsPerformed;
}

- (void)setAlterationsPerformed:(int)a3
{
  self->_alterationsPerformed = a3;
}

- (SUCoreSimulateEvent)lastAlteration
{
  return self->_lastAlteration;
}

- (void)setLastAlteration:(id)a3
{
}

- (OS_dispatch_queue)simulateQueue
{
  return self->_simulateQueue;
}

- (BOOL)simulatorEnabled
{
  return self->_simulatorEnabled;
}

- (NSDictionary)eventAlterations
{
  return self->_eventAlterations;
}

- (void)setEventAlterations:(id)a3
{
}

- (id)registeredCallback
{
  return self->_registeredCallback;
}

- (void)setRegisteredCallback:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)_performSimulatedEventAlteration:(os_log_s *)a3 .cold.1(void *a1, void *a2, os_log_s *a3)
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  int v5 = [a1 alterationsPerformed];
  [a2 summary];
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = 67109378;
  v7[1] = v5;
  __int16 v8 = 2112;
  uint64_t v9 = v6;
  _os_log_fault_impl( &dword_187139000,  a3,  OS_LOG_TYPE_FAULT,  "[SIMULATE] PERFORM #%d - causing fault: %@",  (uint8_t *)v7,  0x12u);
}

@end