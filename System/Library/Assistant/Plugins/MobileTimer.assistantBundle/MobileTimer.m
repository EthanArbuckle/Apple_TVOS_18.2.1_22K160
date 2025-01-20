void sub_4C9C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_5148(_Unwind_Exception *a1)
{
}

uint64_t sub_5178(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_5188(uint64_t a1)
{
}

id sub_5190(uint64_t a1, void *a2)
{
  v3 = a2;
  uint64_t v4 = MTLogForCategory(3LL);
  v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543618;
    uint64_t v61 = v6;
    __int16 v62 = 2114;
    v63 = v3;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ alarm fetch returned alarms: %{public}@", buf, 0x16u);
  }

  v7 = -[NSSet initWithArray:](objc_alloc(&OBJC_CLASS___NSSet), "initWithArray:", *(void *)(a1 + 40));
  v8 = -[NSMutableArray initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableArray),  "initWithCapacity:",  -[NSSet count](v7, "count"));
  __int128 v52 = 0u;
  __int128 v53 = 0u;
  __int128 v54 = 0u;
  __int128 v55 = 0u;
  obj = v3;
  id v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v52,  v59,  16LL);
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v53;
    do
    {
      for (i = 0LL; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v53 != v11) {
          objc_enumerationMutation(obj);
        }
        v13 = *(void **)(*((void *)&v52 + 1) + 8LL * (void)i);
        v14 = (void *)objc_claimAutoreleasedReturnValue([v13 alarmURL]);
        unsigned int v15 = -[NSSet containsObject:](v7, "containsObject:", v14);

        if (v15) {
          -[NSMutableArray addObject:](v8, "addObject:", v13);
        }
      }

      id v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v52,  v59,  16LL);
    }

    while (v10);
  }

  id v16 = -[NSMutableArray count](v8, "count");
  uint64_t v17 = MTLogForCategory(3LL);
  v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
  v19 = v18;
  if (v16)
  {
    v42 = v7;
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v20 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      uint64_t v61 = v20;
      __int16 v62 = 2114;
      v63 = v8;
      _os_log_impl(&dword_0, v19, OS_LOG_TYPE_DEFAULT, "%{public}@ found alarms to dismiss: %{public}@", buf, 0x16u);
    }

    v21 = -[NSMutableArray initWithCapacity:](objc_alloc(&OBJC_CLASS___NSMutableArray), "initWithCapacity:", v16);
    __int128 v48 = 0u;
    __int128 v49 = 0u;
    __int128 v50 = 0u;
    __int128 v51 = 0u;
    v41 = v8;
    v43 = v8;
    id v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v43,  "countByEnumeratingWithState:objects:count:",  &v48,  v56,  16LL);
    if (v22)
    {
      id v23 = v22;
      uint64_t v24 = *(void *)v49;
      do
      {
        for (j = 0LL; j != v23; j = (char *)j + 1)
        {
          if (*(void *)v49 != v24) {
            objc_enumerationMutation(v43);
          }
          v26 = *(NSMutableArray **)(*((void *)&v48 + 1) + 8LL * (void)j);
          uint64_t v27 = MTLogForCategory(3LL);
          v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v29 = *(void *)(a1 + 32);
            *(_DWORD *)buf = 138543618;
            uint64_t v61 = v29;
            __int16 v62 = 2114;
            v63 = v26;
            _os_log_impl(&dword_0, v28, OS_LOG_TYPE_DEFAULT, "%{public}@ dismissing alarm: %{public}@", buf, 0x16u);
          }

          v30 = *(void **)(a1 + 48);
          v31 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray alarmIDString](v26, "alarmIDString"));
          v32 = (void *)objc_claimAutoreleasedReturnValue([v30 dismissAlarmWithIdentifier:v31]);

          v45[0] = _NSConcreteStackBlock;
          v45[1] = 3221225472LL;
          v45[2] = sub_5710;
          v45[3] = &unk_18440;
          id v46 = *(id *)(a1 + 32);
          v47 = v26;
          id v33 = [v32 addCompletionBlock:v45];
          -[NSMutableArray addObject:](v21, "addObject:", v32);
        }

        id v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v43,  "countByEnumeratingWithState:objects:count:",  &v48,  v56,  16LL);
      }

      while (v23);
    }

    uint64_t v34 = MTLogForCategory(3LL);
    v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v36 = *(void *)(a1 + 32);
      v37 = (NSMutableArray *)-[NSMutableArray count](v21, "count");
      *(_DWORD *)buf = 138543618;
      uint64_t v61 = v36;
      __int16 v62 = 2048;
      v63 = v37;
      _os_log_impl(&dword_0, v35, OS_LOG_TYPE_DEFAULT, "%{public}@ combining dismiss futures. Count: %tu", buf, 0x16u);
    }

    v38 = (void *)objc_claimAutoreleasedReturnValue( +[MTScheduler globalAsyncSchedulerWithPriority:]( &OBJC_CLASS___MTScheduler,  "globalAsyncSchedulerWithPriority:",  +[MTScheduler defaultPriority](&OBJC_CLASS___MTScheduler, "defaultPriority")));
    v39 = (void *)objc_claimAutoreleasedReturnValue( +[NAFuture combineAllFutures:ignoringErrors:scheduler:]( &OBJC_CLASS___NAFuture,  "combineAllFutures:ignoringErrors:scheduler:",  v21,  0LL,  v38));
    v8 = v41;
    v7 = v42;
  }

  else
  {
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      sub_103FC(a1, v19);
    }

    NSErrorUserInfoKey v57 = NSLocalizedDescriptionKey;
    v58 = @"No alarm matches the alarm IDs.";
    v21 = (NSMutableArray *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v58,  &v57,  1LL));
    v38 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.mobiletimer.SAAlarmDismiss",  2LL,  v21));
    v39 = (void *)objc_claimAutoreleasedReturnValue(+[NAFuture futureWithError:](&OBJC_CLASS___NAFuture, "futureWithError:", v38));
  }

  return v39;
}

void sub_5710(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = MTLogForCategory(3LL);
  uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  v7 = v6;
  if (v4)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_10470(a1, (uint64_t)v4, v7);
    }
  }

  else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = *(void *)(a1 + 32);
    uint64_t v9 = *(void *)(a1 + 40);
    int v10 = 138543618;
    uint64_t v11 = v8;
    __int16 v12 = 2114;
    uint64_t v13 = v9;
    _os_log_impl( &dword_0,  v7,  OS_LOG_TYPE_DEFAULT,  "%{public}@ dismiss alarm %{public}@ succeeded",  (uint8_t *)&v10,  0x16u);
  }
}

void sub_57FC(uint64_t a1, void *a2)
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "na_firstObjectPassingTest:", &stru_184A8));
  uint64_t v4 = MTLogForCategory(3LL);
  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  uint64_t v6 = v5;
  if (v3)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_10500();
    }

    id v7 = objc_alloc(&OBJC_CLASS___SACommandFailed);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v3 userInfo]);
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:NSLocalizedDescriptionKey]);
    id v10 = [v7 initWithReason:v9];

    objc_msgSend(v10, "setErrorCode:", objc_msgSend(v3, "code"));
    uint64_t v11 = *(void *)(*(void *)(a1 + 48) + 8LL);
    __int16 v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;
  }

  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = *(void *)(a1 + 32);
      int v16 = 138543362;
      uint64_t v17 = v13;
      _os_log_impl( &dword_0,  v6,  OS_LOG_TYPE_DEFAULT,  "%{public}@ combined alarm dismiss future succeeded",  (uint8_t *)&v16,  0xCu);
    }

    id v14 = objc_alloc_init(&OBJC_CLASS___SACommandSucceeded);
    uint64_t v15 = *(void *)(*(void *)(a1 + 48) + 8LL);
    __int16 v12 = *(void **)(v15 + 40);
    *(void *)(v15 + 40) = v14;
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

BOOL sub_5998(id a1, id a2)
{
  id v2 = a2;
  uint64_t v3 = objc_opt_class(&OBJC_CLASS___NSError);
  char isKindOfClass = objc_opt_isKindOfClass(v2, v3);

  return isKindOfClass & 1;
}

void sub_59E0(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = MTLogForCategory(3LL);
  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    sub_10500();
  }

  id v6 = objc_alloc(&OBJC_CLASS___SACommandFailed);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v3 userInfo]);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:NSLocalizedDescriptionKey]);
  id v9 = [v6 initWithReason:v8];

  objc_msgSend(v9, "setErrorCode:", objc_msgSend(v3, "code"));
  uint64_t v10 = *(void *)(*(void *)(a1 + 48) + 8LL);
  uint64_t v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v9;
  id v12 = v9;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

Class sub_5AD8(uint64_t a1)
{
  id v3 = 0LL;
  if (!qword_206B0)
  {
    __int128 v4 = off_18540;
    uint64_t v5 = 0LL;
    qword_206B0 = _sl_dlopen(&v4, &v3);
  }

  if (!qword_206B0) {
    sub_10564(&v3);
  }
  if (v3) {
    free(v3);
  }
  Class result = objc_getClass("COAlarmManager");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL)) {
    sub_105E0();
  }
  qword_206A8 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
  return result;
}

uint64_t sub_5BB4(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(void *)(a3 + 4) = v3;
  *(_WORD *)(a3 + 12) = 2114;
  *(void *)(a3 + 14) = result;
  *(_WORD *)(a3 + 22) = 2112;
  *(void *)(a3 + 24) = a2;
  return result;
}

void sub_5BD4(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
}

  ;
}

void sub_5BF0(void *a1@<X0>, const char *a2@<X3>, uint8_t *a3@<X4>, os_log_s *a4@<X8>)
{
}

void sub_5C00( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

void sub_5CF0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_619C(_Unwind_Exception *a1)
{
}

uint64_t sub_61CC(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_61DC(uint64_t a1)
{
}

id sub_61E4(uint64_t a1, void *a2)
{
  uint64_t v3 = a2;
  uint64_t v4 = MTLogForCategory(3LL);
  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543618;
    uint64_t v61 = v6;
    __int16 v62 = 2114;
    v63 = v3;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ alarm fetch returned alarms: %{public}@", buf, 0x16u);
  }

  id v7 = -[NSSet initWithArray:](objc_alloc(&OBJC_CLASS___NSSet), "initWithArray:", *(void *)(a1 + 40));
  uint64_t v8 = -[NSMutableArray initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableArray),  "initWithCapacity:",  -[NSSet count](v7, "count"));
  __int128 v52 = 0u;
  __int128 v53 = 0u;
  __int128 v54 = 0u;
  __int128 v55 = 0u;
  obj = v3;
  id v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v52,  v59,  16LL);
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v53;
    do
    {
      for (i = 0LL; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v53 != v11) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void **)(*((void *)&v52 + 1) + 8LL * (void)i);
        id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 alarmURL]);
        unsigned int v15 = -[NSSet containsObject:](v7, "containsObject:", v14);

        if (v15) {
          -[NSMutableArray addObject:](v8, "addObject:", v13);
        }
      }

      id v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v52,  v59,  16LL);
    }

    while (v10);
  }

  id v16 = -[NSMutableArray count](v8, "count");
  uint64_t v17 = MTLogForCategory(3LL);
  v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
  v19 = v18;
  if (v16)
  {
    v42 = v7;
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v20 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      uint64_t v61 = v20;
      __int16 v62 = 2114;
      v63 = v8;
      _os_log_impl(&dword_0, v19, OS_LOG_TYPE_DEFAULT, "%{public}@ found alarms to snooze: %{public}@", buf, 0x16u);
    }

    v21 = -[NSMutableArray initWithCapacity:](objc_alloc(&OBJC_CLASS___NSMutableArray), "initWithCapacity:", v16);
    __int128 v48 = 0u;
    __int128 v49 = 0u;
    __int128 v50 = 0u;
    __int128 v51 = 0u;
    v41 = v8;
    v43 = v8;
    id v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v43,  "countByEnumeratingWithState:objects:count:",  &v48,  v56,  16LL);
    if (v22)
    {
      id v23 = v22;
      uint64_t v24 = *(void *)v49;
      do
      {
        for (j = 0LL; j != v23; j = (char *)j + 1)
        {
          if (*(void *)v49 != v24) {
            objc_enumerationMutation(v43);
          }
          v26 = *(NSMutableArray **)(*((void *)&v48 + 1) + 8LL * (void)j);
          uint64_t v27 = MTLogForCategory(3LL);
          v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v29 = *(void *)(a1 + 32);
            *(_DWORD *)buf = 138543618;
            uint64_t v61 = v29;
            __int16 v62 = 2114;
            v63 = v26;
            _os_log_impl(&dword_0, v28, OS_LOG_TYPE_DEFAULT, "%{public}@ snooze alarm: %{public}@", buf, 0x16u);
          }

          v30 = *(void **)(a1 + 48);
          v31 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray alarmIDString](v26, "alarmIDString"));
          v32 = (void *)objc_claimAutoreleasedReturnValue([v30 snoozeAlarmWithIdentifier:v31]);

          v45[0] = _NSConcreteStackBlock;
          v45[1] = 3221225472LL;
          v45[2] = sub_6764;
          v45[3] = &unk_18440;
          id v46 = *(id *)(a1 + 32);
          v47 = v26;
          id v33 = [v32 addCompletionBlock:v45];
          -[NSMutableArray addObject:](v21, "addObject:", v32);
        }

        id v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v43,  "countByEnumeratingWithState:objects:count:",  &v48,  v56,  16LL);
      }

      while (v23);
    }

    uint64_t v34 = MTLogForCategory(3LL);
    v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v36 = *(void *)(a1 + 32);
      v37 = (NSMutableArray *)-[NSMutableArray count](v21, "count");
      *(_DWORD *)buf = 138543618;
      uint64_t v61 = v36;
      __int16 v62 = 2048;
      v63 = v37;
      _os_log_impl(&dword_0, v35, OS_LOG_TYPE_DEFAULT, "%{public}@ combining snooze futures. Count: %tu", buf, 0x16u);
    }

    v38 = (void *)objc_claimAutoreleasedReturnValue( +[MTScheduler globalAsyncSchedulerWithPriority:]( &OBJC_CLASS___MTScheduler,  "globalAsyncSchedulerWithPriority:",  +[MTScheduler defaultPriority](&OBJC_CLASS___MTScheduler, "defaultPriority")));
    v39 = (void *)objc_claimAutoreleasedReturnValue( +[NAFuture combineAllFutures:ignoringErrors:scheduler:]( &OBJC_CLASS___NAFuture,  "combineAllFutures:ignoringErrors:scheduler:",  v21,  0LL,  v38));
    uint64_t v8 = v41;
    id v7 = v42;
  }

  else
  {
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      sub_107E0(a1, v19);
    }

    NSErrorUserInfoKey v57 = NSLocalizedDescriptionKey;
    v58 = @"No alarm matches the alarm IDs.";
    v21 = (NSMutableArray *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v58,  &v57,  1LL));
    v38 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.mobiletimer.SAAlarmSnooze",  2LL,  v21));
    v39 = (void *)objc_claimAutoreleasedReturnValue(+[NAFuture futureWithError:](&OBJC_CLASS___NAFuture, "futureWithError:", v38));
  }

  return v39;
}

void sub_6764(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = MTLogForCategory(3LL);
  uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  id v7 = v6;
  if (v4)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_10854(a1, (uint64_t)v4, v7);
    }
  }

  else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = *(void *)(a1 + 32);
    uint64_t v9 = *(void *)(a1 + 40);
    int v10 = 138543618;
    uint64_t v11 = v8;
    __int16 v12 = 2114;
    uint64_t v13 = v9;
    _os_log_impl( &dword_0,  v7,  OS_LOG_TYPE_DEFAULT,  "%{public}@ snooze alarm %{public}@ succeeded",  (uint8_t *)&v10,  0x16u);
  }
}

void sub_6850(uint64_t a1, void *a2)
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "na_firstObjectPassingTest:", &stru_18558));
  uint64_t v4 = MTLogForCategory(3LL);
  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  uint64_t v6 = v5;
  if (v3)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_108E4();
    }

    id v7 = objc_alloc(&OBJC_CLASS___SACommandFailed);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v3 userInfo]);
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:NSLocalizedDescriptionKey]);
    id v10 = [v7 initWithReason:v9];

    objc_msgSend(v10, "setErrorCode:", objc_msgSend(v3, "code"));
    uint64_t v11 = *(void *)(*(void *)(a1 + 48) + 8LL);
    __int16 v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;
  }

  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = *(void *)(a1 + 32);
      int v16 = 138543362;
      uint64_t v17 = v13;
      _os_log_impl( &dword_0,  v6,  OS_LOG_TYPE_DEFAULT,  "%{public}@ combined alarm snooze future succeeded",  (uint8_t *)&v16,  0xCu);
    }

    id v14 = objc_alloc_init(&OBJC_CLASS___SACommandSucceeded);
    uint64_t v15 = *(void *)(*(void *)(a1 + 48) + 8LL);
    __int16 v12 = *(void **)(v15 + 40);
    *(void *)(v15 + 40) = v14;
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

BOOL sub_69EC(id a1, id a2)
{
  id v2 = a2;
  uint64_t v3 = objc_opt_class(&OBJC_CLASS___NSError);
  char isKindOfClass = objc_opt_isKindOfClass(v2, v3);

  return isKindOfClass & 1;
}

void sub_6A34(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = MTLogForCategory(3LL);
  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    sub_108E4();
  }

  id v6 = objc_alloc(&OBJC_CLASS___SACommandFailed);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v3 userInfo]);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:NSLocalizedDescriptionKey]);
  id v9 = [v6 initWithReason:v8];

  objc_msgSend(v9, "setErrorCode:", objc_msgSend(v3, "code"));
  uint64_t v10 = *(void *)(*(void *)(a1 + 48) + 8LL);
  uint64_t v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v9;
  id v12 = v9;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

Class sub_6B2C(uint64_t a1)
{
  id v3 = 0LL;
  if (!qword_206C0)
  {
    __int128 v4 = off_18578;
    uint64_t v5 = 0LL;
    qword_206C0 = _sl_dlopen(&v4, &v3);
  }

  if (!qword_206C0) {
    sub_10564(&v3);
  }
  if (v3) {
    free(v3);
  }
  Class result = objc_getClass("COAlarmManager");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL)) {
    sub_105E0();
  }
  qword_206B8 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
  return result;
}

void sub_73CC( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, id location, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, char a43)
{
}

uint64_t sub_7420(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_7430(uint64_t a1)
{
}

void sub_7438(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  uint64_t v3 = MTLogForCategory(3LL);
  __int128 v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138543362;
    id v11 = WeakRetained;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ create alarm succeeded", (uint8_t *)&v10, 0xCu);
  }

  +[MTAnalytics incrementEventCount:](&OBJC_CLASS___MTAnalytics, "incrementEventCount:", kMTCASiriAlarmAdds);
  id v5 = objc_alloc_init(&OBJC_CLASS___SAAlarmCreateCompleted);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) alarmURL]);
  [v5 setAlarmId:v6];

  uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8LL);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v9 = v5;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void sub_7564(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v5 = MTLogForCategory(3LL);
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    sub_10B30();
  }

  id v7 = objc_alloc_init(&OBJC_CLASS___SACommandFailed);
  uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8LL);
  id v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_7CF4( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, id location)
{
}

uint64_t sub_7D58(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_7D68(uint64_t a1)
{
}

id sub_7D70(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v5 = MTLogForCategory(4LL);
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v22 = WeakRetained;
    __int16 v23 = 2114;
    id v24 = v3;
    _os_log_impl( &dword_0,  v6,  OS_LOG_TYPE_DEFAULT,  "%{public}@ timer fetch completed with timer: %{public}@",  buf,  0x16u);
  }

  [v3 duration];
  double v8 = v7;
  id v9 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained timer]);
  int v10 = (void *)objc_claimAutoreleasedReturnValue([v9 timerValue]);

  if (v10)
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained timer]);
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 timerValue]);
    double v8 = (double)(uint64_t)[v12 integerValue];
  }

  if ([v3 state] == (char *)&dword_0 + 1)
  {
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) startCurrentTimerWithDuration:v8]);
  }

  else
  {
    uint64_t v14 = MTLogForCategory(4LL);
    uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v22 = WeakRetained;
      _os_log_impl(&dword_0, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ stopping current timer before restarting", buf, 0xCu);
    }

    int v16 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) stopCurrentTimer]);
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = sub_7FA0;
    v18[3] = &unk_185E8;
    id v19 = *(id *)(a1 + 32);
    double v20 = v8;
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v16 flatMap:v18]);
  }

  return v13;
}

id sub_7FA0(uint64_t a1)
{
  return [*(id *)(a1 + 32) startCurrentTimerWithDuration:*(double *)(a1 + 40)];
}

void sub_7FB0(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v3 = MTLogForCategory(4LL);
  __int128 v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138543362;
    id v9 = WeakRetained;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ set timer succeeded", (uint8_t *)&v8, 0xCu);
  }

  id v5 = objc_alloc_init(&OBJC_CLASS___SATimerSetCompleted);
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8LL);
  double v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_8094(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v5 = MTLogForCategory(4LL);
  uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138543618;
    id v11 = WeakRetained;
    __int16 v12 = 2114;
    id v13 = v3;
    _os_log_impl( &dword_0,  v6,  OS_LOG_TYPE_DEFAULT,  "%{public}@ set timer failed with error: %{public}@",  (uint8_t *)&v10,  0x16u);
  }

  id v7 = objc_alloc_init(&OBJC_CLASS___SACommandFailed);
  uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8LL);
  id v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_87BC( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, char a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, id location)
{
}

uint64_t sub_8828(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_8838(uint64_t a1)
{
}

void sub_8840(uint64_t a1, void *a2)
{
  id v3 = (id *)(a1 + 48);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  uint64_t v6 = MTLogForCategory(3LL);
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138543362;
    id v14 = WeakRetained;
    _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ alarm update succeeded", (uint8_t *)&v13, 0xCu);
  }

  id v8 = objc_alloc_init(&OBJC_CLASS___SAAlarmUpdateCompleted);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "na_map:", &stru_18678));

  [v8 setAlarmIds:v9];
  uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8LL);
  id v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v8;
  id v12 = v8;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

NSURL *__cdecl sub_8974(id a1, MTAlarm *a2)
{
  return (NSURL *)-[MTAlarm alarmURL](a2, "alarmURL");
}

void sub_897C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v5 = MTLogForCategory(3LL);
  uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    sub_10F80();
  }

  id v7 = objc_alloc(&OBJC_CLASS___SACommandFailed);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v3 userInfo]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:NSLocalizedDescriptionKey]);
  id v10 = [v7 initWithReason:v9];

  uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8LL);
  id v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v10;
  id v13 = v10;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_8BCC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_8BF4(int8x16_t *a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6 = a2;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 hour]);

  if (v7)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 hour]);
    id v9 = [v8 unsignedIntegerValue];
    uint64_t v10 = *(void *)(a1[2].i64[1] + 8);
    id v40 = *(id *)(v10 + 40);
    BOOL v11 = MTValidateAlarmHour((unint64_t)v9, &v40);
    objc_storeStrong((id *)(v10 + 40), v40);
    *(_BYTE *)(*(void *)(a1[2].i64[0] + 8) + 24LL) = v11;
  }

  if (*(_BYTE *)(*(void *)(a1[2].i64[0] + 8) + 24LL))
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v6 minute]);

    if (v12)
    {
      id v13 = (void *)objc_claimAutoreleasedReturnValue([v6 minute]);
      id v14 = [v13 unsignedIntegerValue];
      uint64_t v15 = *(void *)(a1[2].i64[1] + 8);
      id v39 = *(id *)(v15 + 40);
      BOOL v16 = MTValidateAlarmMinute((unint64_t)v14, &v39);
      objc_storeStrong((id *)(v15 + 40), v39);
      *(_BYTE *)(*(void *)(a1[2].i64[0] + 8) + 24LL) = v16;
    }
  }

  if (*(_BYTE *)(*(void *)(a1[2].i64[0] + 8) + 24LL))
  {
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v6 addedFrequency]);

    if (v17)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue([v6 addedFrequency]);
      uint64_t v19 = *(void *)(a1[2].i64[1] + 8);
      id obj = *(id *)(v19 + 40);
      char v20 = MTValidateAlarmFrequency(v18, &obj);
      objc_storeStrong((id *)(v19 + 40), obj);
      *(_BYTE *)(*(void *)(a1[2].i64[0] + 8) + 24LL) = v20;
    }
  }

  if (*(_BYTE *)(*(void *)(a1[2].i64[0] + 8) + 24LL))
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue([v6 removedFrequency]);

    if (v21)
    {
      id v22 = (void *)objc_claimAutoreleasedReturnValue([v6 removedFrequency]);
      uint64_t v23 = *(void *)(a1[2].i64[1] + 8);
      id v37 = *(id *)(v23 + 40);
      char v24 = MTValidateAlarmFrequency(v22, &v37);
      objc_storeStrong((id *)(v23 + 40), v37);
      *(_BYTE *)(*(void *)(a1[2].i64[0] + 8) + 24LL) = v24;
    }
  }

  if (*(_BYTE *)(*(void *)(a1[2].i64[0] + 8) + 24LL))
  {
    uint64_t v25 = objc_claimAutoreleasedReturnValue([v6 addedFrequency]);
    if (v25)
    {
      v26 = (void *)v25;
      uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue([v6 removedFrequency]);

      if (v27)
      {
        v28 = (void *)objc_claimAutoreleasedReturnValue([v6 addedFrequency]);
        v34[0] = _NSConcreteStackBlock;
        v34[1] = 3221225472LL;
        v34[2] = sub_8F1C;
        v34[3] = &unk_186C8;
        id v35 = v6;
        int8x16_t v36 = vextq_s8(a1[2], a1[2], 8uLL);
        [v28 enumerateObjectsUsingBlock:v34];
      }
    }
  }

  if (*(_BYTE *)(*(void *)(a1[2].i64[0] + 8) + 24LL))
  {
    uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue([v6 label]);

    if (v29)
    {
      v30 = (void *)objc_claimAutoreleasedReturnValue([v6 label]);
      uint64_t v31 = *(void *)(a1[2].i64[1] + 8);
      id v33 = *(id *)(v31 + 40);
      BOOL v32 = MTValidateAlarmLabel(v30, &v33);
      objc_storeStrong((id *)(v31 + 40), v33);
      *(_BYTE *)(*(void *)(a1[2].i64[0] + 8) + 24LL) = v32;
    }
  }

  if (!*(_BYTE *)(*(void *)(a1[2].i64[0] + 8) + 24LL)) {
    *a4 = 1;
  }
}

void sub_8F1C(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6 = a2;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) removedFrequency]);
  unsigned int v8 = [v7 containsObject:v6];

  if (v8)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) addedFrequency]);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) removedFrequency]);
    BOOL v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Cannot add a frequency (%@) that is also being removed. Added: %@, Removed: %@",  v6,  v9,  v10));

    NSErrorUserInfoKey v16 = NSLocalizedDescriptionKey;
    uint64_t v17 = v11;
    id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v17,  &v16,  1LL));
    uint64_t v13 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.mobiletimer.assistant",  4LL,  v12));
    uint64_t v14 = *(void *)(*(void *)(a1 + 40) + 8LL);
    uint64_t v15 = *(void **)(v14 + 40);
    *(void *)(v14 + 40) = v13;

    *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = 0;
    *a4 = 1;
  }
}

void sub_91FC( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
}

id sub_9220(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v5 = MTLogForCategory(3LL);
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v18 = WeakRetained;
    __int16 v19 = 2114;
    id v20 = v3;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ alarm fetch returned alarms: %{public}@", buf, 0x16u);
  }

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained modifications]);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_93CC;
  v13[3] = &unk_18768;
  id v14 = v3;
  id v15 = WeakRetained;
  id v16 = *(id *)(a1 + 32);
  id v8 = v3;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "na_map:", v13));

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[MTScheduler globalAsyncSchedulerWithPriority:]( &OBJC_CLASS___MTScheduler,  "globalAsyncSchedulerWithPriority:",  +[MTScheduler defaultPriority](&OBJC_CLASS___MTScheduler, "defaultPriority")));
  BOOL v11 = (void *)objc_claimAutoreleasedReturnValue( +[NAFuture combineAllFutures:ignoringErrors:scheduler:]( &OBJC_CLASS___NAFuture,  "combineAllFutures:ignoringErrors:scheduler:",  v9,  0LL,  v10));

  return v11;
}

id sub_93CC(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472LL;
  v22[2] = sub_96A4;
  v22[3] = &unk_18718;
  id v5 = v3;
  id v23 = v5;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "na_firstObjectPassingTest:", v22));
  uint64_t v7 = MTLogForCategory(3LL);
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  id v9 = v8;
  if (v6)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      uint64_t v25 = v10;
      __int16 v26 = 2114;
      uint64_t v27 = v6;
      _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ found matching alarm: %{public}@", buf, 0x16u);
    }

    BOOL v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) updateAlarm:v6 withModification:v5]);
    uint64_t v12 = MTLogForCategory(3LL);
    uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      uint64_t v25 = v14;
      __int16 v26 = 2114;
      uint64_t v27 = v11;
      _os_log_impl(&dword_0, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ updating alarm: %{public}@", buf, 0x16u);
    }

    id v15 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) updateAlarm:v11]);
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472LL;
    v20[2] = sub_9704;
    v20[3] = &unk_18740;
    id v21 = v11;
    id v16 = v11;
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v15 flatMap:v20]);
  }

  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_10FE0(a1, v9);
    }

    id v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", &stru_18B40));
    NSErrorUserInfoKey v28 = NSLocalizedDescriptionKey;
    uint64_t v29 = v15;
    id v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v29,  &v28,  1LL));
    id v16 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.mobiletimer.assistant",  0LL,  v18));

    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(+[NAFuture futureWithError:](&OBJC_CLASS___NAFuture, "futureWithError:", v16));
  }

  return v17;
}

id sub_96A4(uint64_t a1, void *a2)
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue([a2 alarmURL]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) alarmId]);
  id v5 = [v3 isEqual:v4];

  return v5;
}

id sub_9704(uint64_t a1)
{
  return +[NAFuture futureWithResult:](&OBJC_CLASS___NAFuture, "futureWithResult:", *(void *)(a1 + 32));
}

LABEL_34:
  return v6;
}

void sub_9F8C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, id a36, char a37)
{
}

uint64_t sub_9FC8(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_9FD8(uint64_t a1)
{
}

void sub_9FE0(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  uint64_t v8 = MTLogForCategory(3LL);
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 138543874;
    id v17 = WeakRetained;
    __int16 v18 = 2114;
    id v19 = v5;
    __int16 v20 = 2114;
    id v21 = v6;
    _os_log_impl( &dword_0,  v9,  OS_LOG_TYPE_DEFAULT,  "%{public}@ alarm fetch returned alarms: %{public}@, error: %{public}@",  (uint8_t *)&v16,  0x20u);
  }

  uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8LL);
  BOOL v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v5;
  id v12 = v5;

  uint64_t v13 = *(void *)(*(void *)(a1 + 48) + 8LL);
  uint64_t v14 = *(void **)(v13 + 40);
  *(void *)(v13 + 40) = v6;
  id v15 = v6;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t sub_A114(uint64_t a1)
{
  uint64_t v2 = MTLogForCategory(3LL);
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    int v15 = 138543362;
    uint64_t v16 = v4;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ alarm search completed", (uint8_t *)&v15, 0xCu);
  }

  if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 40LL)) {
    id v5 = objc_alloc_init(&OBJC_CLASS___SACommandFailed);
  }
  else {
    id v5 = (id)objc_claimAutoreleasedReturnValue( [*(id *)(a1 + 32) searchWithAlarms:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40)]);
  }
  uint64_t v6 = *(void *)(*(void *)(a1 + 64) + 8LL);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  uint64_t v8 = MTLogForCategory(3LL);
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    sub_11288(a1);
  }

  uint64_t v10 = *(void *)(a1 + 48);
  BOOL v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) dictionary]);
  (*(void (**)(uint64_t, void *))(v10 + 16))(v10, v11);

  uint64_t v12 = MTLogForCategory(3LL);
  uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
    sub_111F0(a1, a1 + 64);
  }

  +[MTAnalytics incrementEventCount:](&OBJC_CLASS___MTAnalytics, "incrementEventCount:", kMTCASiriAlarmSearches);
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void sub_AD84(id a1)
{
  uint64_t v1 = objc_claimAutoreleasedReturnValue(+[NSCharacterSet punctuationCharacterSet](&OBJC_CLASS___NSCharacterSet, "punctuationCharacterSet"));
  uint64_t v2 = (void *)qword_206C8;
  qword_206C8 = v1;

  uint64_t v3 = objc_claimAutoreleasedReturnValue( +[NSCharacterSet whitespaceAndNewlineCharacterSet]( &OBJC_CLASS___NSCharacterSet,  "whitespaceAndNewlineCharacterSet"));
  uint64_t v4 = (void *)qword_206D0;
  qword_206D0 = v3;
}

  ;
}

void sub_ADF4( void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

void sub_B1BC( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, id location)
{
}

uint64_t sub_B210(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_B220(uint64_t a1)
{
}

void sub_B228(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v5 = MTLogForCategory(4LL);
  uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138543618;
    id v14 = WeakRetained;
    __int16 v15 = 2112;
    id v16 = v3;
    _os_log_impl( &dword_0,  v6,  OS_LOG_TYPE_DEFAULT,  "%{public}@ timer fetch completed with timer: %@",  (uint8_t *)&v13,  0x16u);
  }

  id v7 = SATimerObjectForMTTimer(v3);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  id v9 = objc_alloc_init(&OBJC_CLASS___SATimerGetCompleted);
  [v9 setTimer:v8];
  uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8LL);
  BOOL v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v9;
  id v12 = v9;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_B358(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v5 = MTLogForCategory(4LL);
  uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    sub_114A8((uint64_t)WeakRetained, (uint64_t)v3, v6);
  }

  id v7 = objc_alloc_init(&OBJC_CLASS___SACommandFailed);
  uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8LL);
  id v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

uint64_t MTAlarmRepeatDayFromSAAlarmDayOfWeek(unsigned int a1)
{
  if (a1 > 8) {
    return 1LL;
  }
  else {
    return qword_14100[a1];
  }
}

NSMutableArray *SAAlarmFrequencyFromRepeatSchedule(uint64_t a1)
{
  uint64_t v2 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  id v3 = v2;
  if (a1)
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_B4BC;
    v7[3] = &unk_18878;
    uint64_t v8 = v2;
    MTAlarmRepeatScheduleEnumerateDays(a1, v7);
  }

  else
  {
    uint64_t v4 = stringForSAAlarmDayOfWeek(1LL);
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
    -[NSMutableArray addObject:](v3, "addObject:", v5);
  }

  return v3;
}

void sub_B4BC(uint64_t a1, uint64_t a2)
{
  switch(a2)
  {
    case 0LL:
      uint64_t v2 = *(void **)(a1 + 32);
      uint64_t v3 = 2LL;
      goto LABEL_9;
    case 1LL:
      uint64_t v2 = *(void **)(a1 + 32);
      uint64_t v3 = 3LL;
      goto LABEL_9;
    case 2LL:
      uint64_t v2 = *(void **)(a1 + 32);
      uint64_t v3 = 4LL;
      goto LABEL_9;
    case 3LL:
      uint64_t v2 = *(void **)(a1 + 32);
      uint64_t v3 = 5LL;
      goto LABEL_9;
    case 4LL:
      uint64_t v2 = *(void **)(a1 + 32);
      uint64_t v3 = 6LL;
      goto LABEL_9;
    case 5LL:
      uint64_t v2 = *(void **)(a1 + 32);
      uint64_t v3 = 7LL;
      goto LABEL_9;
    case 6LL:
      uint64_t v2 = *(void **)(a1 + 32);
      uint64_t v3 = 8LL;
LABEL_9:
      uint64_t v4 = stringForSAAlarmDayOfWeek(v3);
      id v5 = (id)objc_claimAutoreleasedReturnValue(v4);
      objc_msgSend(v2, "addObject:");

      break;
    default:
      return;
  }
}

uint64_t MTValidateAlarmRelativeOffsetMinutes(unint64_t a1, void *a2)
{
  if (a1 < 0x2D1) {
    return 1LL;
  }
  uint64_t v4 = -[NSCalendar initWithCalendarIdentifier:]( objc_alloc(&OBJC_CLASS___NSCalendar),  "initWithCalendarIdentifier:",  NSCalendarIdentifierGregorian);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimeZone defaultTimeZone](&OBJC_CLASS___NSTimeZone, "defaultTimeZone"));
  -[NSCalendar setTimeZone:](v4, "setTimeZone:", v5);

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  id v7 = objc_alloc_init(&OBJC_CLASS___NSDateComponents);
  -[NSDateComponents setDay:](v7, "setDay:", 1LL);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( -[NSCalendar dateByAddingComponents:toDate:options:]( v4,  "dateByAddingComponents:toDate:options:",  v7,  v6,  0LL));
  id v9 = objc_alloc_init(&OBJC_CLASS___NSDateComponents);
  -[NSDateComponents setMinute:](v9, "setMinute:", a1);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( -[NSCalendar dateByAddingComponents:toDate:options:]( v4,  "dateByAddingComponents:toDate:options:",  v9,  v6,  0LL));
  BOOL v11 = (void *)objc_claimAutoreleasedReturnValue([v8 laterDate:v10]);

  BOOL v12 = v11 == v10;
  BOOL v13 = v11 != v10;
  if (v12)
  {
    uint64_t v14 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Relative offset must not be more than one day. Offset: %lu",  a1));
    __int16 v15 = a2;
    id v19 = (void *)v14;
    NSErrorUserInfoKey v20 = NSLocalizedDescriptionKey;
    uint64_t v21 = v14;
    id v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v21,  &v20,  1LL));
    id v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.mobiletimer.assistant",  1LL,  v16));

    if (v15) {
      *__int16 v15 = v17;
    }
  }

  return v13;
}

BOOL MTValidateAlarmHour(unint64_t a1, void *a2)
{
  if (a1 >= 0x18)
  {
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Hour must be between 0 and 23, inclusive. Hour = %lu",  a1));
    NSErrorUserInfoKey v8 = NSLocalizedDescriptionKey;
    id v9 = v4;
    id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v9,  &v8,  1LL));
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.mobiletimer.assistant",  2LL,  v5));

    if (a2) {
      *a2 = v6;
    }
  }

  return a1 < 0x18;
}

BOOL MTValidateAlarmMinute(unint64_t a1, void *a2)
{
  if (a1 >= 0x3C)
  {
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Minute must be between 0 and 59, inclusive. Minute = %lu",  a1));
    NSErrorUserInfoKey v8 = NSLocalizedDescriptionKey;
    id v9 = v4;
    id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v9,  &v8,  1LL));
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.mobiletimer.assistant",  3LL,  v5));

    if (a2) {
      *a2 = v6;
    }
  }

  return a1 < 0x3C;
}

uint64_t MTValidateAlarmFrequency(void *a1, void *a2)
{
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  id v3 = a1;
  id v4 = [v3 countByEnumeratingWithState:&v19 objects:v29 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = 0LL;
    uint64_t v7 = *(void *)v20;
    while (2)
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v20 != v7) {
          objc_enumerationMutation(v3);
        }
        uint64_t v9 = *(void *)(*((void *)&v19 + 1) + 8LL * (void)i);
        if (SAAlarmDayOfWeekForString(v9) == 1)
        {
          if ([v3 count] != (char *)&dword_0 + 1)
          {
            uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"SAClockAlarmDayNever must be specified alone. Frequency: %@",  v3));
            NSErrorUserInfoKey v27 = NSLocalizedDescriptionKey;
            NSErrorUserInfoKey v28 = v14;
            __int16 v15 = &v28;
            id v16 = &v27;
LABEL_22:
            id v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v15,  v16,  1LL));
            BOOL v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.mobiletimer.assistant",  4LL,  v17));

            uint64_t v13 = 0LL;
            goto LABEL_23;
          }
        }

        else
        {
          if (SAAlarmDayOfWeekForString(v9) < 2 || SAAlarmDayOfWeekForString(v9) >= 9)
          {
            uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Frequency contains invalid day: %@. Frequency: %@",  v9,  v3,  (void)v19));
            NSErrorUserInfoKey v25 = NSLocalizedDescriptionKey;
            uint64_t v26 = v14;
            __int16 v15 = &v26;
            id v16 = &v25;
            goto LABEL_22;
          }

          unsigned int v10 = SAAlarmDayOfWeekForString(v9);
          if (v10 > 8) {
            uint64_t v11 = 1LL;
          }
          else {
            uint64_t v11 = qword_14100[v10];
          }
          if ((v11 & v6) != 0)
          {
            uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Frequency contains %@ multiple times. Frequency: %@",  v9,  v3,  (void)v19));
            NSErrorUserInfoKey v23 = NSLocalizedDescriptionKey;
            char v24 = v14;
            __int16 v15 = &v24;
            id v16 = &v23;
            goto LABEL_22;
          }

          v6 |= v11;
        }
      }

      id v5 = [v3 countByEnumeratingWithState:&v19 objects:v29 count:16];
      BOOL v12 = 0LL;
      uint64_t v13 = 1LL;
      if (v5) {
        continue;
      }
      break;
    }
  }

  else
  {
    BOOL v12 = 0LL;
    uint64_t v13 = 1LL;
  }

LABEL_23:
  if (a2) {
    *a2 = v12;
  }

  return v13;
}

BOOL MTValidateAlarmLabel(void *a1, void *a2)
{
  id v3 = [a1 length];
  if (!v3)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"A zero-length label is not allowed"));
    NSErrorUserInfoKey v8 = NSLocalizedDescriptionKey;
    uint64_t v9 = v4;
    id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v9,  &v8,  1LL));
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.mobiletimer.assistant",  5LL,  v5));

    if (a2) {
      *a2 = v6;
    }
  }

  return v3 != 0LL;
}

void sub_C100( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, id location)
{
}

uint64_t sub_C154(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_C164(uint64_t a1)
{
}

id sub_C16C(uint64_t a1, void *a2)
{
  uint64_t v37 = a2;
  id val = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v2 = MTLogForCategory(3LL);
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v53 = val;
    __int16 v54 = 2114;
    __int128 v55 = v37;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ alarm fetch returned alarms: %{public}@", buf, 0x16u);
  }

  id obj = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  __int128 v48 = 0u;
  __int128 v49 = 0u;
  __int128 v46 = 0u;
  __int128 v47 = 0u;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([val alarmIds]);
  id v5 = [v4 countByEnumeratingWithState:&v46 objects:v51 count:16];
  if (v5)
  {
    uint64_t v7 = *(void *)v47;
    *(void *)&__int128 v6 = 138543618LL;
    __int128 v32 = v6;
    do
    {
      NSErrorUserInfoKey v8 = 0LL;
      do
      {
        if (*(void *)v47 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(NSMutableArray **)(*((void *)&v46 + 1) + 8LL * (void)v8);
        v45[0] = _NSConcreteStackBlock;
        v45[1] = 3221225472LL;
        v45[2] = sub_C74C;
        v45[3] = &unk_18718;
        void v45[4] = v9;
        unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray na_firstObjectPassingTest:](v37, "na_firstObjectPassingTest:", v45, v32));
        if (v10)
        {
          -[NSMutableArray addObject:](obj, "addObject:", v10);
        }

        else
        {
          uint64_t v11 = MTLogForCategory(3LL);
          BOOL v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v32;
            id v53 = val;
            __int16 v54 = 2114;
            __int128 v55 = v9;
            _os_log_error_impl( &dword_0,  v12,  OS_LOG_TYPE_ERROR,  "%{public}@ Attempt to delete unknown alarm: %{public}@",  buf,  0x16u);
          }
        }

        NSErrorUserInfoKey v8 = (char *)v8 + 1;
      }

      while (v5 != v8);
      id v5 = [v4 countByEnumeratingWithState:&v46 objects:v51 count:16];
    }

    while (v5);
  }

  if (!-[NSMutableArray count](obj, "count"))
  {
    uint64_t v13 = MTLogForCategory(3LL);
    uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_116B0((uint64_t)val, v14);
    }
  }

  uint64_t v15 = MTLogForCategory(3LL);
  id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v53 = val;
    __int16 v54 = 2114;
    __int128 v55 = obj;
    _os_log_impl(&dword_0, v16, OS_LOG_TYPE_DEFAULT, "%{public}@ found alarms to delete: %{public}@", buf, 0x16u);
  }

  id v17 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  objc_initWeak(&location, val);
  __int128 v42 = 0u;
  __int128 v43 = 0u;
  __int128 v40 = 0u;
  __int128 v41 = 0u;
  obja = obj;
  id v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obja,  "countByEnumeratingWithState:objects:count:",  &v40,  v50,  16LL);
  if (v18)
  {
    uint64_t v19 = *(void *)v41;
    do
    {
      for (i = 0LL; i != v18; i = (char *)i + 1)
      {
        if (*(void *)v41 != v19) {
          objc_enumerationMutation(obja);
        }
        __int128 v21 = *(NSMutableArray **)(*((void *)&v40 + 1) + 8LL * (void)i);
        uint64_t v22 = MTLogForCategory(3LL);
        NSErrorUserInfoKey v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          id v53 = val;
          __int16 v54 = 2114;
          __int128 v55 = v21;
          _os_log_impl(&dword_0, v23, OS_LOG_TYPE_DEFAULT, "%{public}@ deleting alarm: %{public}@", buf, 0x16u);
        }

        uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) removeAlarm:v21]);
        v38[0] = _NSConcreteStackBlock;
        v38[1] = 3221225472LL;
        v38[2] = sub_C78C;
        v38[3] = &unk_188A0;
        objc_copyWeak(&v39, &location);
        v38[4] = v21;
        id v25 = [v24 addCompletionBlock:v38];
        -[NSMutableArray addObject:](v17, "addObject:", v24);
        objc_destroyWeak(&v39);
      }

      id v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obja,  "countByEnumeratingWithState:objects:count:",  &v40,  v50,  16LL);
    }

    while (v18);
  }

  uint64_t v26 = MTLogForCategory(3LL);
  NSErrorUserInfoKey v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    NSErrorUserInfoKey v28 = (NSMutableArray *)-[NSMutableArray count](v17, "count");
    *(_DWORD *)buf = 138543618;
    id v53 = val;
    __int16 v54 = 2048;
    __int128 v55 = v28;
    _os_log_impl(&dword_0, v27, OS_LOG_TYPE_DEFAULT, "%{public}@ combining delete futures. Count: %lu", buf, 0x16u);
  }

  uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue( +[MTScheduler globalAsyncSchedulerWithPriority:]( &OBJC_CLASS___MTScheduler,  "globalAsyncSchedulerWithPriority:",  +[MTScheduler defaultPriority](&OBJC_CLASS___MTScheduler, "defaultPriority")));
  v30 = (void *)objc_claimAutoreleasedReturnValue( +[NAFuture combineAllFutures:ignoringErrors:scheduler:]( &OBJC_CLASS___NAFuture,  "combineAllFutures:ignoringErrors:scheduler:",  v17,  0LL,  v29));

  objc_destroyWeak(&location);
  return v30;
}

void sub_C6F4( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, id location)
{
}

id sub_C74C(uint64_t a1, void *a2)
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue([a2 alarmURL]);
  id v4 = [v3 isEqual:*(void *)(a1 + 32)];

  return v4;
}

void sub_C78C(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v6 = MTLogForCategory(3LL);
  uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  NSErrorUserInfoKey v8 = v7;
  if (v4)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      int v11 = 138543874;
      id v12 = WeakRetained;
      __int16 v13 = 2114;
      uint64_t v14 = v9;
      __int16 v15 = 2114;
      id v16 = v4;
      _os_log_error_impl( &dword_0,  v8,  OS_LOG_TYPE_ERROR,  "%{public}@ delete alarm %{public}@ failed with error: %{public}@",  (uint8_t *)&v11,  0x20u);
    }
  }

  else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = *(void *)(a1 + 32);
    int v11 = 138543618;
    id v12 = WeakRetained;
    __int16 v13 = 2114;
    uint64_t v14 = v10;
    _os_log_impl( &dword_0,  v8,  OS_LOG_TYPE_DEFAULT,  "%{public}@ delete alarm %{public}@ succeeded",  (uint8_t *)&v11,  0x16u);
  }
}

void sub_C8C4(uint64_t a1, void *a2)
{
  id v3 = (id *)(a1 + 48);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "na_firstObjectPassingTest:", &stru_188C0));

  uint64_t v7 = MTLogForCategory(3LL);
  NSErrorUserInfoKey v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  uint64_t v9 = v8;
  if (v6)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_11720((uint64_t)WeakRetained, (uint64_t)v6, v9);
    }

    id v10 = objc_alloc(&OBJC_CLASS___SACommandFailed);
    int v11 = (void *)objc_claimAutoreleasedReturnValue([v6 userInfo]);
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:NSLocalizedDescriptionKey]);
    id v13 = [v10 initWithReason:v12];

    objc_msgSend(v13, "setErrorCode:", objc_msgSend(v6, "code"));
    uint64_t v14 = *(void *)(*(void *)(a1 + 40) + 8LL);
    __int16 v15 = *(void **)(v14 + 40);
    *(void *)(v14 + 40) = v13;
  }

  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 138543362;
      id v19 = WeakRetained;
      _os_log_impl( &dword_0,  v9,  OS_LOG_TYPE_DEFAULT,  "%{public}@ combined alarm delete future succeeded",  (uint8_t *)&v18,  0xCu);
    }

    +[MTAnalytics incrementEventCount:](&OBJC_CLASS___MTAnalytics, "incrementEventCount:", kMTCASiriAlarmRemoves);
    id v16 = objc_alloc_init(&OBJC_CLASS___SAAlarmDeleteCompleted);
    uint64_t v17 = *(void *)(*(void *)(a1 + 40) + 8LL);
    __int16 v15 = *(void **)(v17 + 40);
    *(void *)(v17 + 40) = v16;
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

BOOL sub_CA94(id a1, id a2)
{
  id v2 = a2;
  uint64_t v3 = objc_opt_class(&OBJC_CLASS___NSError);
  char isKindOfClass = objc_opt_isKindOfClass(v2, v3);

  return isKindOfClass & 1;
}

void sub_D00C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, id location, char a25)
{
}

uint64_t sub_D050(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_D060(uint64_t a1)
{
}

void sub_D068(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v5 = MTLogForCategory(3LL);
  uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138543618;
    id v11 = WeakRetained;
    __int16 v12 = 2114;
    id v13 = v3;
    _os_log_impl( &dword_0,  v6,  OS_LOG_TYPE_DEFAULT,  "%{public}@ alarm fetch completed with alarms: %{public}@",  (uint8_t *)&v10,  0x16u);
  }

  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8LL);
  NSErrorUserInfoKey v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v3;
  id v9 = v3;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_D160(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v5 = MTLogForCategory(3LL);
  uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    sub_11960((uint64_t)WeakRetained, (uint64_t)v3, v6);
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_D474(uint64_t a1, void *a2)
{
  id v3 = (id)objc_claimAutoreleasedReturnValue([a2 displayTitle]);
  if (![v3 length]) {
    NSLog(@"Unexpected zero-length displayTitle: %@", v3);
  }
  [*(id *)(a1 + 32) appendString:v3];
}

void sub_DBB4( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, id location)
{
}

uint64_t sub_DC18(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_DC28(uint64_t a1)
{
}

id sub_DC30(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v5 = MTLogForCategory(4LL);
  uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v19 = WeakRetained;
    __int16 v20 = 2114;
    id v21 = v3;
    _os_log_impl( &dword_0,  v6,  OS_LOG_TYPE_DEFAULT,  "%{public}@ timer fetch completed with timer: %{public}@",  buf,  0x16u);
  }

  if (v3)
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v3 timerByUpdatingWithState:1]);
    uint64_t v8 = MTLogForCategory(4LL);
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      id v19 = WeakRetained;
      __int16 v20 = 2114;
      id v21 = v7;
      _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ stopping timer: %{public}@", buf, 0x16u);
    }

    uint64_t v10 = objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) updateTimer:v7]);
  }

  else
  {
    uint64_t v11 = MTLogForCategory(4LL);
    __int16 v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_11B68((uint64_t)WeakRetained, v12);
    }

    NSErrorUserInfoKey v16 = NSLocalizedDescriptionKey;
    uint64_t v17 = @"No existing timer to cancel";
    id v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v17,  &v16,  1LL));
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.mobiletimer.SATimerCancel",  1LL,  v13));

    uint64_t v10 = objc_claimAutoreleasedReturnValue(+[NAFuture futureWithError:](&OBJC_CLASS___NAFuture, "futureWithError:", v7));
  }

  uint64_t v14 = (void *)v10;

  return v14;
}

void sub_DE4C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v3 = MTLogForCategory(4LL);
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138543362;
    id v9 = WeakRetained;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ cancel timer succeeded", (uint8_t *)&v8, 0xCu);
  }

  id v5 = objc_alloc_init(&OBJC_CLASS___SATimerCancelCompleted);
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8LL);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_DF30(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v5 = MTLogForCategory(4LL);
  uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    sub_11BD8((uint64_t)WeakRetained, (uint64_t)v3, v6);
  }

  id v7 = objc_alloc_init(&OBJC_CLASS___SACommandFailed);
  uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8LL);
  id v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_E094( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void sub_E528(_Unwind_Exception *a1)
{
}

uint64_t sub_E558(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_E568(uint64_t a1)
{
}

id sub_E570(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = MTLogForCategory(4LL);
  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543618;
    uint64_t v64 = v6;
    __int16 v65 = 2114;
    v66 = v3;
    _os_log_impl( &dword_0,  v5,  OS_LOG_TYPE_DEFAULT,  "%{public}@ timer fetch completed with timers: %{public}@",  buf,  0x16u);
  }

  id v7 = -[NSSet initWithArray:](objc_alloc(&OBJC_CLASS___NSSet), "initWithArray:", *(void *)(a1 + 40));
  uint64_t v8 = -[NSMutableArray initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableArray),  "initWithCapacity:",  -[NSSet count](v7, "count"));
  __int128 v55 = 0u;
  __int128 v56 = 0u;
  __int128 v57 = 0u;
  __int128 v58 = 0u;
  id v9 = v3;
  uint64_t v10 = v8;
  id obj = v9;
  id v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v9,  "countByEnumeratingWithState:objects:count:",  &v55,  v62,  16LL);
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v56;
    do
    {
      for (i = 0LL; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v56 != v13) {
          objc_enumerationMutation(obj);
        }
        __int16 v15 = *(void **)(*((void *)&v55 + 1) + 8LL * (void)i);
        NSErrorUserInfoKey v16 = (void *)objc_claimAutoreleasedReturnValue([v15 timerURL]);
        unsigned int v17 = -[NSSet containsObject:](v7, "containsObject:", v16);

        if (v17) {
          -[NSMutableArray addObject:](v10, "addObject:", v15);
        }
      }

      id v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v55,  v62,  16LL);
    }

    while (v12);
  }

  id v18 = -[NSMutableArray count](v10, "count");
  uint64_t v19 = MTLogForCategory(4LL);
  __int16 v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
  id v21 = v20;
  if (v18)
  {
    v45 = v7;
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v22 = *(void *)(a1 + 48);
      *(_DWORD *)buf = 138543618;
      uint64_t v64 = v22;
      __int16 v65 = 2114;
      v66 = v10;
      _os_log_impl(&dword_0, v21, OS_LOG_TYPE_DEFAULT, "%{public}@ found timers to dismiss: %{public}@", buf, 0x16u);
    }

    NSErrorUserInfoKey v23 = -[NSMutableArray initWithCapacity:](objc_alloc(&OBJC_CLASS___NSMutableArray), "initWithCapacity:", v18);
    __int128 v51 = 0u;
    __int128 v52 = 0u;
    __int128 v53 = 0u;
    __int128 v54 = 0u;
    v44 = v10;
    __int128 v46 = v10;
    id v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v46,  "countByEnumeratingWithState:objects:count:",  &v51,  v59,  16LL);
    if (v24)
    {
      id v25 = v24;
      uint64_t v26 = *(void *)v52;
      do
      {
        for (j = 0LL; j != v25; j = (char *)j + 1)
        {
          if (*(void *)v52 != v26) {
            objc_enumerationMutation(v46);
          }
          NSErrorUserInfoKey v28 = *(NSMutableArray **)(*((void *)&v51 + 1) + 8LL * (void)j);
          uint64_t v29 = MTLogForCategory(4LL);
          v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
          if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v31 = *(void *)(a1 + 48);
            *(_DWORD *)buf = 138543618;
            uint64_t v64 = v31;
            __int16 v65 = 2114;
            v66 = v28;
            _os_log_impl(&dword_0, v30, OS_LOG_TYPE_DEFAULT, "%{public}@ dismissing timer: %{public}@", buf, 0x16u);
          }

          __int128 v32 = *(void **)(a1 + 56);
          uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray timerID](v28, "timerID"));
          uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue([v33 UUIDString]);
          id v35 = (void *)objc_claimAutoreleasedReturnValue([v32 dismissTimerWithIdentifier:v34]);

          v48[0] = _NSConcreteStackBlock;
          v48[1] = 3221225472LL;
          v48[2] = sub_EB04;
          v48[3] = &unk_18440;
          id v49 = *(id *)(a1 + 48);
          __int128 v50 = v28;
          id v36 = [v35 addCompletionBlock:v48];
          -[NSMutableArray addObject:](v23, "addObject:", v35);
        }

        id v25 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v46,  "countByEnumeratingWithState:objects:count:",  &v51,  v59,  16LL);
      }

      while (v25);
    }

    uint64_t v37 = MTLogForCategory(4LL);
    v38 = (os_log_s *)objc_claimAutoreleasedReturnValue(v37);
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v39 = *(void *)(a1 + 48);
      __int128 v40 = (NSMutableArray *)-[NSMutableArray count](v23, "count");
      *(_DWORD *)buf = 138543618;
      uint64_t v64 = v39;
      __int16 v65 = 2048;
      v66 = v40;
      _os_log_impl(&dword_0, v38, OS_LOG_TYPE_DEFAULT, "%{public}@ combining dismiss futures. Count: %tu", buf, 0x16u);
    }

    __int128 v41 = (void *)objc_claimAutoreleasedReturnValue( +[MTScheduler globalAsyncSchedulerWithPriority:]( &OBJC_CLASS___MTScheduler,  "globalAsyncSchedulerWithPriority:",  +[MTScheduler defaultPriority](&OBJC_CLASS___MTScheduler, "defaultPriority")));
    __int128 v42 = (void *)objc_claimAutoreleasedReturnValue( +[NAFuture combineAllFutures:ignoringErrors:scheduler:]( &OBJC_CLASS___NAFuture,  "combineAllFutures:ignoringErrors:scheduler:",  v23,  0LL,  v41));
    uint64_t v10 = v44;
    id v7 = v45;
  }

  else
  {
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      sub_11DE0(a1, v21);
    }

    NSErrorUserInfoKey v60 = NSLocalizedDescriptionKey;
    uint64_t v61 = @"No timer matches the timer IDs.";
    NSErrorUserInfoKey v23 = (NSMutableArray *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v61,  &v60,  1LL));
    __int128 v41 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.mobiletimer.SATimerDismiss",  2LL,  v23));
    __int128 v42 = (void *)objc_claimAutoreleasedReturnValue(+[NAFuture futureWithError:](&OBJC_CLASS___NAFuture, "futureWithError:", v41));
  }

  return v42;
}

void sub_EB04(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = MTLogForCategory(4LL);
  uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  id v7 = v6;
  if (v4)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_11E54(a1, (uint64_t)v4, v7);
    }
  }

  else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = *(void *)(a1 + 32);
    uint64_t v9 = *(void *)(a1 + 40);
    int v10 = 138543618;
    uint64_t v11 = v8;
    __int16 v12 = 2114;
    uint64_t v13 = v9;
    _os_log_impl( &dword_0,  v7,  OS_LOG_TYPE_DEFAULT,  "%{public}@ dismiss timer %{public}@ succeeded",  (uint8_t *)&v10,  0x16u);
  }
}

void sub_EBF0(uint64_t a1, void *a2)
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "na_firstObjectPassingTest:", &stru_18958));
  uint64_t v4 = MTLogForCategory(4LL);
  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  uint64_t v6 = v5;
  if (v3)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_11EE4();
    }

    id v7 = objc_alloc(&OBJC_CLASS___SACommandFailed);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v3 userInfo]);
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:NSLocalizedDescriptionKey]);
    id v10 = [v7 initWithReason:v9];

    objc_msgSend(v10, "setErrorCode:", objc_msgSend(v3, "code"));
    uint64_t v11 = *(void *)(*(void *)(a1 + 48) + 8LL);
    __int16 v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;
  }

  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = *(void *)(a1 + 32);
      int v16 = 138543362;
      uint64_t v17 = v13;
      _os_log_impl( &dword_0,  v6,  OS_LOG_TYPE_DEFAULT,  "%{public}@ combined timer dismiss future succeeded",  (uint8_t *)&v16,  0xCu);
    }

    id v14 = objc_alloc_init(&OBJC_CLASS___SACommandSucceeded);
    uint64_t v15 = *(void *)(*(void *)(a1 + 48) + 8LL);
    __int16 v12 = *(void **)(v15 + 40);
    *(void *)(v15 + 40) = v14;
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

BOOL sub_ED8C(id a1, id a2)
{
  id v2 = a2;
  uint64_t v3 = objc_opt_class(&OBJC_CLASS___NSError);
  char isKindOfClass = objc_opt_isKindOfClass(v2, v3);

  return isKindOfClass & 1;
}

void sub_EDD4(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = MTLogForCategory(4LL);
  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    sub_11EE4();
  }

  id v6 = objc_alloc(&OBJC_CLASS___SACommandFailed);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v3 userInfo]);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:NSLocalizedDescriptionKey]);
  id v9 = [v6 initWithReason:v8];

  objc_msgSend(v9, "setErrorCode:", objc_msgSend(v3, "code"));
  uint64_t v10 = *(void *)(*(void *)(a1 + 48) + 8LL);
  uint64_t v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v9;
  id v12 = v9;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

Class sub_EECC(uint64_t a1)
{
  id v3 = 0LL;
  if (!qword_206E8)
  {
    __int128 v4 = off_18978;
    uint64_t v5 = 0LL;
    qword_206E8 = _sl_dlopen(&v4, &v3);
  }

  if (!qword_206E8) {
    sub_11F48(&v3);
  }
  if (v3) {
    free(v3);
  }
  Class result = objc_getClass("COTimerManager");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL)) {
    sub_11FC4();
  }
  qword_206E0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
  return result;
}

void sub_F3E4( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, char a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, id location)
{
}

uint64_t sub_F454(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_F464(uint64_t a1)
{
}

id sub_F46C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v5 = MTLogForCategory(4LL);
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v22 = WeakRetained;
    __int16 v23 = 2114;
    id v24 = v3;
    _os_log_impl( &dword_0,  v6,  OS_LOG_TYPE_DEFAULT,  "%{public}@ timer fetch completed with timer: %{public}@",  buf,  0x16u);
  }

  if (v3)
  {
    uint64_t v7 = objc_claimAutoreleasedReturnValue([v3 timerByUpdatingWithState:2]);
    uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8LL);
    id v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;

    uint64_t v10 = MTLogForCategory(4LL);
    uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      id v12 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL);
      *(_DWORD *)buf = 138543618;
      id v22 = WeakRetained;
      __int16 v23 = 2114;
      id v24 = v12;
      _os_log_impl(&dword_0, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ pausing timer: %{public}@", buf, 0x16u);
    }

    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(a1 + 32) updateTimer:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)]);
  }

  else
  {
    uint64_t v14 = MTLogForCategory(4LL);
    uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_121C4((uint64_t)WeakRetained, v15);
    }

    NSErrorUserInfoKey v19 = NSLocalizedDescriptionKey;
    __int16 v20 = @"No existing timer to pause";
    int v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v20,  &v19,  1LL));
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.mobiletimer.SATimerPause",  1LL,  v16));

    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[NAFuture futureWithError:](&OBJC_CLASS___NAFuture, "futureWithError:", v17));
  }

  return v13;
}

void sub_F6AC(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  uint64_t v3 = MTLogForCategory(4LL);
  __int128 v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138543362;
    id v12 = WeakRetained;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ pause timer succeeded", (uint8_t *)&v11, 0xCu);
  }

  id v5 = objc_alloc_init(&OBJC_CLASS___SATimerPauseCompleted);
  if ([WeakRetained requiresResponse])
  {
    id v6 = SATimerObjectForMTTimer(*(void **)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL));
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    [v5 setTimer:v7];
  }

  uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8LL);
  id v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v5;
  id v10 = v5;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_F7D4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v5 = MTLogForCategory(4LL);
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    sub_12234((uint64_t)WeakRetained, (uint64_t)v3, v6);
  }

  id v7 = objc_alloc_init(&OBJC_CLASS___SACommandFailed);
  uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8LL);
  id v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

id SATimerObjectForMTTimer(void *a1)
{
  id v1 = a1;
  id v2 = objc_alloc_init(&OBJC_CLASS___SATimerObject);
  switch((unint64_t)[v1 state])
  {
    case 0uLL:
    case 4uLL:
      NSLog(@"Unexpected timer state %ld", [v1 state]);
      [v2 setState:SATimerStateUndefinedValue];
      [v2 setTimerValue:&off_18F40];
      break;
    case 1uLL:
      id v3 = &SATimerStateStoppedValue;
      goto LABEL_6;
    case 2uLL:
      id v3 = &SATimerStatePausedValue;
      goto LABEL_6;
    case 3uLL:
      id v3 = &SATimerStateRunningValue;
LABEL_6:
      [v2 setState:*v3];
      [v1 remainingTime];
      __int128 v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:"));
      [v2 setTimerValue:v4];

      break;
    default:
      break;
  }

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v1 isFiring]));
  [v2 setIsFiring:v5];

  return v2;
}

void sub_FDE8( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, char a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, id location)
{
}

uint64_t sub_FE58(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void sub_FE68(uint64_t a1)
{
}

id sub_FE70(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v5 = MTLogForCategory(4LL);
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v22 = WeakRetained;
    __int16 v23 = 2114;
    id v24 = v3;
    _os_log_impl( &dword_0,  v6,  OS_LOG_TYPE_DEFAULT,  "%{public}@ timer fetch completed with timer: %{public}@",  buf,  0x16u);
  }

  if (v3)
  {
    uint64_t v7 = objc_claimAutoreleasedReturnValue([v3 timerByUpdatingWithState:3]);
    uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8LL);
    id v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;

    uint64_t v10 = MTLogForCategory(4LL);
    int v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      id v12 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL);
      *(_DWORD *)buf = 138543618;
      id v22 = WeakRetained;
      __int16 v23 = 2114;
      id v24 = v12;
      _os_log_impl(&dword_0, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ resuming timer: %{public}@", buf, 0x16u);
    }

    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( [*(id *)(a1 + 32) updateTimer:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)]);
  }

  else
  {
    uint64_t v14 = MTLogForCategory(4LL);
    uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_1243C((uint64_t)WeakRetained, v15);
    }

    NSErrorUserInfoKey v19 = NSLocalizedDescriptionKey;
    __int16 v20 = @"No existing timer to resume";
    int v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v20,  &v19,  1LL));
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"com.apple.mobiletimer.SATimerResume",  1LL,  v16));

    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[NAFuture futureWithError:](&OBJC_CLASS___NAFuture, "futureWithError:", v17));
  }

  return v13;
}

void sub_100B0(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  uint64_t v3 = MTLogForCategory(4LL);
  __int128 v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138543362;
    id v12 = WeakRetained;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ resume timer succeeded", (uint8_t *)&v11, 0xCu);
  }

  id v5 = objc_alloc_init(&OBJC_CLASS___SATimerResumeCompleted);
  if ([WeakRetained requiresResponse])
  {
    id v6 = SATimerObjectForMTTimer(*(void **)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL));
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    [v5 setTimer:v7];
  }

  uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8LL);
  id v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v5;
  id v10 = v5;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_101D8(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v5 = MTLogForCategory(4LL);
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    sub_124AC((uint64_t)WeakRetained, (uint64_t)v3, v6);
  }

  id v7 = objc_alloc_init(&OBJC_CLASS___SACommandFailed);
  uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8LL);
  id v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_10274( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_5C00(&dword_0, a1, a3, "===== exiting %s =====", a5, a6, a7, a8, 2u);
  sub_5BE8();
}

void sub_102E4( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_5C00(&dword_0, a1, a3, "===== %s =====", a5, a6, a7, a8, 2u);
  sub_5BE8();
}

void sub_10354(uint64_t a1, void *a2, _DWORD *a3)
{
  *a3 = 136315650;
  sub_5BB4(a1, (uint64_t)a2, (uint64_t)a3);
  sub_5BF0(&dword_0, "%s %{public}@ did call completion handler with %@", v4, v5);
}

void sub_103A8(uint64_t a1, void *a2, _DWORD *a3)
{
  *a3 = 136315650;
  sub_5BB4(a1, (uint64_t)a2, (uint64_t)a3);
  sub_5BF0(&dword_0, "%s %{public}@ will call completion handler with %@", v4, v5);
}

void sub_103FC(uint64_t a1, os_log_s *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = 138543362;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "%{public}@ found no alarms to dismiss", (uint8_t *)&v3, 0xCu);
  sub_5BE8();
}

void sub_10470(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  int v5 = 138543874;
  uint64_t v6 = v3;
  __int16 v7 = 2114;
  uint64_t v8 = v4;
  __int16 v9 = 2114;
  uint64_t v10 = a2;
  _os_log_error_impl( &dword_0,  log,  OS_LOG_TYPE_ERROR,  "%{public}@ dismiss alarm %{public}@ failed with error: %{public}@",  (uint8_t *)&v5,  0x20u);
}

void sub_10500()
{
}

void sub_10564(void *a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "void *CoordinationLibrary(void)"));
  objc_msgSend( v2,  "handleFailureInFunction:file:lineNumber:description:",  v3,  @"AlarmManager.h",  13,  @"%s",  *a1);

  __break(1u);
}

void sub_105E0()
{
  uint64_t v0 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
  os_log_t v1 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "Class getCOAlarmManagerClass(void)_block_invoke"));
  objc_msgSend( v0,  "handleFailureInFunction:file:lineNumber:description:",  v1,  @"AlarmManager.h",  14,  @"Unable to find class %s",  "COAlarmManager");

  __break(1u);
}

void sub_10658( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_5C00(&dword_0, a1, a3, "===== exiting %s =====", a5, a6, a7, a8, 2u);
  sub_5BE8();
}

void sub_106C8( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_5C00(&dword_0, a1, a3, "===== %s =====", a5, a6, a7, a8, 2u);
  sub_5BE8();
}

void sub_10738(uint64_t a1, void *a2, _DWORD *a3)
{
  *a3 = 136315650;
  sub_5BB4(a1, (uint64_t)a2, (uint64_t)a3);
  sub_5BF0(&dword_0, "%s %{public}@ did call completion handler with %@", v4, v5);
}

void sub_1078C(uint64_t a1, void *a2, _DWORD *a3)
{
  *a3 = 136315650;
  sub_5BB4(a1, (uint64_t)a2, (uint64_t)a3);
  sub_5BF0(&dword_0, "%s %{public}@ will call completion handler with %@", v4, v5);
}

void sub_107E0(uint64_t a1, os_log_s *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = 138543362;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "%{public}@ found no alarms to snooze", (uint8_t *)&v3, 0xCu);
  sub_5BE8();
}

void sub_10854(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  int v5 = 138543874;
  uint64_t v6 = v3;
  __int16 v7 = 2114;
  uint64_t v8 = v4;
  __int16 v9 = 2114;
  uint64_t v10 = a2;
  _os_log_error_impl( &dword_0,  log,  OS_LOG_TYPE_ERROR,  "%{public}@ snooze alarm %{public}@ failed with error: %{public}@",  (uint8_t *)&v5,  0x20u);
}

void sub_108E4()
{
}

void sub_10948( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_5C00(&dword_0, a1, a3, "===== exiting %s =====", a5, a6, a7, a8, 2u);
  sub_5BE8();
}

void sub_109B8( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_5C00(&dword_0, a1, a3, "===== %s =====", a5, a6, a7, a8, 2u);
  sub_5BE8();
}

void sub_10A28(uint64_t a1, void *a2, _DWORD *a3)
{
  *a3 = 136315650;
  sub_5BB4(a1, (uint64_t)a2, (uint64_t)a3);
  sub_5BF0(&dword_0, "%s %{public}@ did call completion handler with %@", v4, v5);
}

void sub_10A7C(uint64_t a1, void *a2, _DWORD *a3)
{
  *a3 = 136315650;
  sub_5BB4(a1, (uint64_t)a2, (uint64_t)a3);
  sub_5BF0(&dword_0, "%s %{public}@ will call completion handler with %@", v4, v5);
}

void sub_10AD0()
{
}

void sub_10B30()
{
}

void sub_10B90( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_5C00(&dword_0, a1, a3, "===== exiting %s =====", a5, a6, a7, a8, 2u);
  sub_5BE8();
}

void sub_10C00( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_5C00(&dword_0, a1, a3, "===== %s =====", a5, a6, a7, a8, 2u);
  sub_5BE8();
}

void sub_10C70(uint64_t a1, void *a2, _DWORD *a3)
{
  *a3 = 136315650;
  sub_5BB4(a1, (uint64_t)a2, (uint64_t)a3);
  sub_5BF0(&dword_0, "%s %{public}@ did call completion handler with %@", v4, v5);
}

void sub_10CC4(uint64_t a1, void *a2, _DWORD *a3)
{
  *a3 = 136315650;
  sub_5BB4(a1, (uint64_t)a2, (uint64_t)a3);
  sub_5BF0(&dword_0, "%s %{public}@ will call completion handler with %@", v4, v5);
}

void sub_10D18(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2114;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "%{public}@ timer set failed: %{public}@", (uint8_t *)&v3, 0x16u);
  sub_5BE8();
}

void sub_10D98( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_5C00(&dword_0, a1, a3, "===== exiting %s =====", a5, a6, a7, a8, 2u);
  sub_5BE8();
}

void sub_10E08( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_5C00(&dword_0, a1, a3, "===== %s =====", a5, a6, a7, a8, 2u);
  sub_5BE8();
}

void sub_10E78(uint64_t a1, void *a2, _DWORD *a3)
{
  *a3 = 136315650;
  sub_5BB4(a1, (uint64_t)a2, (uint64_t)a3);
  sub_5BF0(&dword_0, "%s %{public}@ did call completion handler with %@", v4, v5);
}

void sub_10ECC(uint64_t a1, void *a2, _DWORD *a3)
{
  *a3 = 136315650;
  sub_5BB4(a1, (uint64_t)a2, (uint64_t)a3);
  sub_5BF0(&dword_0, "%s %{public}@ will call completion handler with %@", v4, v5);
}

void sub_10F20()
{
}

void sub_10F80()
{
}

void sub_10FE0(uint64_t a1, os_log_s *a2)
{
  int v3 = *(void **)(a1 + 40);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 alarmId]);
  int v5 = 138543618;
  uint64_t v6 = v3;
  __int16 v7 = 2114;
  uint64_t v8 = v4;
  _os_log_error_impl( &dword_0,  a2,  OS_LOG_TYPE_ERROR,  "%{public}@ no alarm found with alarmIDURL: %{public}@",  (uint8_t *)&v5,  0x16u);
}

void sub_11090( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_5C00(&dword_0, a1, a3, "===== exiting %s =====", a5, a6, a7, a8, 2u);
  sub_5BE8();
}

void sub_11100( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_5C00(&dword_0, a1, a3, "===== %s =====", a5, a6, a7, a8, 2u);
  sub_5BE8();
}

void sub_11170(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2114;
  uint64_t v6 = a2;
  _os_log_error_impl( &dword_0,  log,  OS_LOG_TYPE_ERROR,  "%{public}@ alarm search failed: %{public}@",  (uint8_t *)&v3,  0x16u);
  sub_5BE8();
}

void sub_111F0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(*(void *)a2 + 8) + 40) dictionary]);
  sub_ADD4();
  sub_ADF4(&dword_0, v3, v4, "%s %{public}@ did call completion handler with %@", v5, v6, v7, v8, 2u);

  sub_AE08();
}

void sub_11288(uint64_t a1)
{
  os_log_t v1 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) dictionary]);
  sub_ADD4();
  sub_ADF4(&dword_0, v2, v3, "%s %{public}@ will call completion handler with %@", v4, v5, v6, v7, 2u);

  sub_AE08();
}

void sub_11320( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_5C00(&dword_0, a1, a3, "===== exiting %s =====", a5, a6, a7, a8, 2u);
  sub_5BE8();
}

void sub_11390( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_5C00(&dword_0, a1, a3, "===== %s =====", a5, a6, a7, a8, 2u);
  sub_5BE8();
}

void sub_11400(uint64_t a1, void *a2, _DWORD *a3)
{
  *a3 = 136315650;
  sub_5BB4(a1, (uint64_t)a2, (uint64_t)a3);
  sub_5BF0(&dword_0, "%s %{public}@ did call completion handler with %@", v4, v5);
}

void sub_11454(uint64_t a1, void *a2, _DWORD *a3)
{
  *a3 = 136315650;
  sub_5BB4(a1, (uint64_t)a2, (uint64_t)a3);
  sub_5BF0(&dword_0, "%s %{public}@ will call completion handler with %@", v4, v5);
}

void sub_114A8(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2114;
  uint64_t v6 = a2;
  _os_log_error_impl( &dword_0,  log,  OS_LOG_TYPE_ERROR,  "%{public}@ timer fetch failed with error: %{public}@",  (uint8_t *)&v3,  0x16u);
  sub_5BE8();
}

void sub_11528( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_5C00(&dword_0, a1, a3, "===== exiting %s =====", a5, a6, a7, a8, 2u);
  sub_5BE8();
}

void sub_11598( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_5C00(&dword_0, a1, a3, "===== %s =====", a5, a6, a7, a8, 2u);
  sub_5BE8();
}

void sub_11608(uint64_t a1, void *a2, _DWORD *a3)
{
  *a3 = 136315650;
  sub_5BB4(a1, (uint64_t)a2, (uint64_t)a3);
  sub_5BF0(&dword_0, "%s %{public}@ did call completion handler with %@", v4, v5);
}

void sub_1165C(uint64_t a1, void *a2, _DWORD *a3)
{
  *a3 = 136315650;
  sub_5BB4(a1, (uint64_t)a2, (uint64_t)a3);
  sub_5BF0(&dword_0, "%s %{public}@ will call completion handler with %@", v4, v5);
}

void sub_116B0(uint64_t a1, os_log_s *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "%{public}@ found no alarms to delete", (uint8_t *)&v2, 0xCu);
  sub_5BE8();
}

void sub_11720(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2114;
  uint64_t v6 = a2;
  _os_log_error_impl( &dword_0,  log,  OS_LOG_TYPE_ERROR,  "%{public}@ combined alarm delete future failed with error: %{public}@",  (uint8_t *)&v3,  0x16u);
  sub_5BE8();
}

void sub_117A0( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_5C00(&dword_0, a1, a3, "===== exiting %s =====", a5, a6, a7, a8, 2u);
  sub_5BE8();
}

void sub_11810( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_5C00(&dword_0, a1, a3, "===== %s =====", a5, a6, a7, a8, 2u);
  sub_5BE8();
}

void sub_11880( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_5C00(&dword_0, a1, a3, "===== exiting %s =====", a5, a6, a7, a8, 2u);
  sub_5BE8();
}

void sub_118F0( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_5C00(&dword_0, a1, a3, "===== %s =====", a5, a6, a7, a8, 2u);
  sub_5BE8();
}

void sub_11960(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2114;
  uint64_t v6 = a2;
  _os_log_error_impl( &dword_0,  log,  OS_LOG_TYPE_ERROR,  "%{public}@ alarm fetch failed with error: %{public}@",  (uint8_t *)&v3,  0x16u);
  sub_5BE8();
}

void sub_119E0( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_5C00(&dword_0, a1, a3, "===== exiting %s =====", a5, a6, a7, a8, 2u);
  sub_5BE8();
}

void sub_11A50( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_5C00(&dword_0, a1, a3, "===== %s =====", a5, a6, a7, a8, 2u);
  sub_5BE8();
}

void sub_11AC0(uint64_t a1, void *a2, _DWORD *a3)
{
  *a3 = 136315650;
  sub_5BB4(a1, (uint64_t)a2, (uint64_t)a3);
  sub_5BF0(&dword_0, "%s %{public}@ did call completion handler with %@", v4, v5);
}

void sub_11B14(uint64_t a1, void *a2, _DWORD *a3)
{
  *a3 = 136315650;
  sub_5BB4(a1, (uint64_t)a2, (uint64_t)a3);
  sub_5BF0(&dword_0, "%s %{public}@ will call completion handler with %@", v4, v5);
}

void sub_11B68(uint64_t a1, os_log_s *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "%{public}@ No existing timer to cancel", (uint8_t *)&v2, 0xCu);
  sub_5BE8();
}

void sub_11BD8(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2114;
  uint64_t v6 = a2;
  _os_log_error_impl( &dword_0,  log,  OS_LOG_TYPE_ERROR,  "%{public}@ cancel timer failed with error: %{public}@",  (uint8_t *)&v3,  0x16u);
  sub_5BE8();
}

void sub_11C58( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_5C00(&dword_0, a1, a3, "===== exiting %s =====", a5, a6, a7, a8, 2u);
  sub_5BE8();
}

void sub_11CC8( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_5C00(&dword_0, a1, a3, "===== %s =====", a5, a6, a7, a8, 2u);
  sub_5BE8();
}

void sub_11D38(uint64_t a1, void *a2, _DWORD *a3)
{
  *a3 = 136315650;
  sub_5BB4(a1, (uint64_t)a2, (uint64_t)a3);
  sub_5BF0(&dword_0, "%s %{public}@ did call completion handler with %@", v4, v5);
}

void sub_11D8C(uint64_t a1, void *a2, _DWORD *a3)
{
  *a3 = 136315650;
  sub_5BB4(a1, (uint64_t)a2, (uint64_t)a3);
  sub_5BF0(&dword_0, "%s %{public}@ will call completion handler with %@", v4, v5);
}

void sub_11DE0(uint64_t a1, os_log_s *a2)
{
  uint64_t v2 = *(void *)(a1 + 48);
  int v3 = 138543362;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "%{public}@ found no timers to dismiss", (uint8_t *)&v3, 0xCu);
  sub_5BE8();
}

void sub_11E54(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  int v5 = 138543874;
  uint64_t v6 = v3;
  __int16 v7 = 2114;
  uint64_t v8 = v4;
  __int16 v9 = 2114;
  uint64_t v10 = a2;
  _os_log_error_impl( &dword_0,  log,  OS_LOG_TYPE_ERROR,  "%{public}@ dismiss timer %{public}@ failed with error: %{public}@",  (uint8_t *)&v5,  0x20u);
}

void sub_11EE4()
{
}

void sub_11F48(void *a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "void *CoordinationLibrary(void)"));
  objc_msgSend( v2,  "handleFailureInFunction:file:lineNumber:description:",  v3,  @"TimerManager.h",  13,  @"%s",  *a1);

  __break(1u);
}

void sub_11FC4()
{
  uint64_t v0 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
  os_log_t v1 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "Class getCOTimerManagerClass(void)_block_invoke"));
  objc_msgSend( v0,  "handleFailureInFunction:file:lineNumber:description:",  v1,  @"TimerManager.h",  14,  @"Unable to find class %s",  "COTimerManager");

  __break(1u);
}

void sub_1203C( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_5C00(&dword_0, a1, a3, "===== exiting %s =====", a5, a6, a7, a8, 2u);
  sub_5BE8();
}

void sub_120AC( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_5C00(&dword_0, a1, a3, "===== %s =====", a5, a6, a7, a8, 2u);
  sub_5BE8();
}

void sub_1211C(uint64_t a1, void *a2, _DWORD *a3)
{
  *a3 = 136315650;
  sub_5BB4(a1, (uint64_t)a2, (uint64_t)a3);
  sub_5BF0(&dword_0, "%s %{public}@ did call completion handler with %@", v4, v5);
}

void sub_12170(uint64_t a1, void *a2, _DWORD *a3)
{
  *a3 = 136315650;
  sub_5BB4(a1, (uint64_t)a2, (uint64_t)a3);
  sub_5BF0(&dword_0, "%s %{public}@ will call completion handler with %@", v4, v5);
}

void sub_121C4(uint64_t a1, os_log_s *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "%{public}@ No existing timer to pause", (uint8_t *)&v2, 0xCu);
  sub_5BE8();
}

void sub_12234(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2114;
  uint64_t v6 = a2;
  _os_log_error_impl( &dword_0,  log,  OS_LOG_TYPE_ERROR,  "%{public}@ pause timer failed with error: %{public}@",  (uint8_t *)&v3,  0x16u);
  sub_5BE8();
}

void sub_122B4( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_5C00(&dword_0, a1, a3, "===== exiting %s =====", a5, a6, a7, a8, 2u);
  sub_5BE8();
}

void sub_12324( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_5C00(&dword_0, a1, a3, "===== %s =====", a5, a6, a7, a8, 2u);
  sub_5BE8();
}

void sub_12394(uint64_t a1, void *a2, _DWORD *a3)
{
  *a3 = 136315650;
  sub_5BB4(a1, (uint64_t)a2, (uint64_t)a3);
  sub_5BF0(&dword_0, "%s %{public}@ did call completion handler with %@", v4, v5);
}

void sub_123E8(uint64_t a1, void *a2, _DWORD *a3)
{
  *a3 = 136315650;
  sub_5BB4(a1, (uint64_t)a2, (uint64_t)a3);
  sub_5BF0(&dword_0, "%s %{public}@ will call completion handler with %@", v4, v5);
}

void sub_1243C(uint64_t a1, os_log_s *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "%{public}@ No existing timer to resumt", (uint8_t *)&v2, 0xCu);
  sub_5BE8();
}

void sub_124AC(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2114;
  uint64_t v6 = a2;
  _os_log_error_impl( &dword_0,  log,  OS_LOG_TYPE_ERROR,  "%{public}@ resume timer failed with error: %{public}@",  (uint8_t *)&v3,  0x16u);
  sub_5BE8();
}

id objc_msgSend_whitespaceAndNewlineCharacterSet(void *a1, const char *a2, ...)
{
  return [a1 whitespaceAndNewlineCharacterSet];
}