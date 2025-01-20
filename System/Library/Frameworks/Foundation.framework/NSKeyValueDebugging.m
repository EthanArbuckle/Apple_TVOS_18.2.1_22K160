@interface NSKeyValueDebugging
@end

@implementation NSKeyValueDebugging

uint64_t __28___NSKeyValueDebugging_init__block_invoke(uint64_t a1)
{
  v2 = (void *)[MEMORY[0x189604008] mainRunLoop];
  return [v2 addTimer:*(void *)(a1 + 32) forMode:*MEMORY[0x189603A40]];
}

uint64_t __42___NSKeyValueDebugging__clearWillDidTable__block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  *(_BYTE *)(*(void *)(a1 + 32) + 24LL) = 0;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  v2 = *(void **)(*(void *)(a1 + 32) + 16LL);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v14 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v15;
    do
    {
      uint64_t v6 = 0LL;
      do
      {
        if (*(void *)v15 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v14 + 1) + 8 * v6);
        uint64_t v8 = [*(id *)(*(void *)(a1 + 32) + 16) objectForKeyedSubscript:v7];
        if (v8 && *(uint64_t *)(v8 + 8) >= 1)
        {
          if (_MergedGlobals_132) {
            NSLog( (NSString *)@"<KVODebugging> KVO ISSUE: %@ -- Has called 'will's but did not pair with enough 'did's during the same run loop spin",  v7);
          }
          if (qword_18C496D20 != -1) {
            dispatch_once(&qword_18C496D20, &__block_literal_global_143);
          }
          v9 = (os_log_s *)qword_18C496D18;
          if (os_log_type_enabled((os_log_t)qword_18C496D18, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            uint64_t v12 = v7;
            _os_log_error_impl( &dword_182EB1000,  v9,  OS_LOG_TYPE_ERROR,  "KVO ISSUE: , key: %{public}@ -- Has called 'will's but did not pair with enough 'did's during the same run loop spin",  buf,  0xCu);
          }
        }

        objc_msgSend( *(id *)(a1 + 40),  "setObject:forKeyedSubscript:",  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 32), "objectForKeyedSubscript:", v7),  v7);
        ++v6;
      }

      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v14 objects:v13 count:16];
    }

    while (v4);
  }

  return [*(id *)(*(void *)(a1 + 32) + 16) removeAllObjects];
}

void __66___NSKeyValueDebugging__object_trackChangeForKeyOrKeys_operation___block_invoke( uint64_t a1,  void *a2)
{
  uint64_t v54 = *MEMORY[0x1895F89C0];
  uint64_t v4 = objc_alloc(&OBJC_CLASS____NSKeyValueObjectAndKeyPair);
  if (v4)
  {
    id v5 = -[_NSKeyValueObjectAndKeyPair initWithObject:key:context:](v4, *(void **)(a1 + 32), a2, 0LL);
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)(a1 + 48);
      uint64_t v8 = @"???";
      if (v7 == 1) {
        uint64_t v8 = @"Did change";
      }
      if (v7) {
        v9 = v8;
      }
      else {
        v9 = @"Will change";
      }
      if (_MergedGlobals_132) {
        NSLog((NSString *)@"<KVODebugging> %@ -- Note: %@.", v5, v9);
      }
      if (qword_18C496D20 != -1) {
        dispatch_once(&qword_18C496D20, &__block_literal_global_143);
      }
      v10 = (os_log_s *)qword_18C496D18;
      if (os_log_type_enabled((os_log_t)qword_18C496D18, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = v6;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v9;
        _os_log_impl(&dword_182EB1000, v10, OS_LOG_TYPE_INFO, "%{public}@ -- Note: %{public}@.", buf, 0x16u);
      }

      *(void *)buf = 0LL;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x3052000000LL;
      v51 = __Block_byref_object_copy__18;
      v52 = __Block_byref_object_dispose__18;
      uint64_t v53 = 0LL;
      uint64_t v31 = 0LL;
      v32 = &v31;
      uint64_t v33 = 0x2810000000LL;
      v34 = &unk_183A8509D;
      __int16 v35 = 0;
      char v36 = 0;
      id v11 = objc_alloc_init(MEMORY[0x189603FA8]);
      uint64_t v12 = *(os_unfair_lock_s **)(a1 + 40);
      uint64_t v13 = *(void *)(a1 + 48);
      __int128 v14 = v12 + 2;
      v30[0] = MEMORY[0x1895F87A8];
      v30[1] = 3221225472LL;
      v30[2] = __66___NSKeyValueDebugging__object_trackChangeForKeyOrKeys_operation___block_invoke_82;
      v30[3] = &unk_189CA1718;
      v30[4] = v12;
      v30[5] = v6;
      v30[8] = buf;
      v30[9] = v13;
      v30[6] = v11;
      v30[7] = &v31;
      os_unfair_lock_lock(v12 + 2);
      __66___NSKeyValueDebugging__object_trackChangeForKeyOrKeys_operation___block_invoke_82((uint64_t)v30);
      os_unfair_lock_unlock(v14);
      __int128 v48 = 0u;
      __int128 v49 = 0u;
      __int128 v46 = 0u;
      __int128 v47 = 0u;
      uint64_t v15 = [v11 countByEnumeratingWithState:&v46 objects:v45 count:16];
      if (v15)
      {
        uint64_t v16 = *(void *)v47;
        do
        {
          for (uint64_t i = 0LL; i != v15; ++i)
          {
            if (*(void *)v47 != v16) {
              objc_enumerationMutation(v11);
            }
            uint64_t v18 = *(void *)(*((void *)&v46 + 1) + 8 * i);
            if (v18 && !*(_BYTE *)(v18 + 16))
            {
              v19 = -[_NSKeyValueObjectAndKeyPair newCurrentValue](*(_Unwind_Exception **)(v18 + 8));
              *(_BYTE *)(v18 + 16) = 1;
              [(id)v18 setCurrentValue:v19];
            }
          }

          uint64_t v15 = [v11 countByEnumeratingWithState:&v46 objects:v45 count:16];
        }

        while (v15);
      }

      if (*((_BYTE *)v32 + 32))
      {
        if (_MergedGlobals_132) {
          NSLog( (NSString *)@"KVO ISSUE: %@ -- Has become reentrant ('will' called after 'did') -- in thread: %@, backtrace: %@",  v6,  +[NSThread currentThread](&OBJC_CLASS___NSThread, "currentThread"),  +[NSThread callStackSymbols](&OBJC_CLASS___NSThread, "callStackSymbols"));
        }
        if (qword_18C496D20 != -1) {
          dispatch_once(&qword_18C496D20, &__block_literal_global_143);
        }
        v20 = (os_log_s *)qword_18C496D18;
        if (os_log_type_enabled((os_log_t)qword_18C496D18, OS_LOG_TYPE_ERROR))
        {
          v23 = +[NSThread currentThread](&OBJC_CLASS___NSThread, "currentThread");
          v24 = +[NSThread callStackSymbols](&OBJC_CLASS___NSThread, "callStackSymbols");
          *(_DWORD *)v37 = 138543874;
          v38 = v6;
          __int16 v39 = 2114;
          v40 = v23;
          __int16 v41 = 2114;
          v42 = v24;
          _os_log_error_impl( &dword_182EB1000,  v20,  OS_LOG_TYPE_ERROR,  "KVO ISSUE: %{public}@ -- Has become reentrant ('will' called after 'did') -- in thread: %{public}@, backtrace: %{public}@",  v37,  0x20u);
        }
      }

      if (*((_BYTE *)v32 + 33))
      {
        if (_MergedGlobals_132) {
          NSLog( (NSString *)@"KVO ISSUE: %@ -- Has called 'did' more times than 'will' -- in thread: %@, backtrace: %@",  v6,  +[NSThread currentThread](&OBJC_CLASS___NSThread, "currentThread"),  +[NSThread callStackSymbols](&OBJC_CLASS___NSThread, "callStackSymbols"));
        }
        if (qword_18C496D20 != -1) {
          dispatch_once(&qword_18C496D20, &__block_literal_global_143);
        }
        v21 = (os_log_s *)qword_18C496D18;
        if (os_log_type_enabled((os_log_t)qword_18C496D18, OS_LOG_TYPE_ERROR))
        {
          v25 = +[NSThread currentThread](&OBJC_CLASS___NSThread, "currentThread");
          v26 = +[NSThread callStackSymbols](&OBJC_CLASS___NSThread, "callStackSymbols");
          *(_DWORD *)v37 = 138543874;
          v38 = v6;
          __int16 v39 = 2114;
          v40 = v25;
          __int16 v41 = 2114;
          v42 = v26;
          _os_log_error_impl( &dword_182EB1000,  v21,  OS_LOG_TYPE_ERROR,  "KVO ISSUE: %{public}@ -- Has called 'did' more times than 'will' -- in thread: %{public}@, backtrace: %{public}@",  v37,  0x20u);
        }
      }

      if (*((_BYTE *)v32 + 34))
      {
        if (_MergedGlobals_132) {
          NSLog( (NSString *)@"KVO ISSUE: %@ -- Has called 'will' or 'did' for the same key in multiple threads, first will/did recorded in thread %@ -- in thread: %@, backtrace: %@",  v6,  *(void *)(*(void *)&buf[8] + 40LL),  +[NSThread currentThread](&OBJC_CLASS___NSThread, "currentThread"),  +[NSThread callStackSymbols](&OBJC_CLASS___NSThread, "callStackSymbols"));
        }
        if (qword_18C496D20 != -1) {
          dispatch_once(&qword_18C496D20, &__block_literal_global_143);
        }
        v22 = (os_log_s *)qword_18C496D18;
        if (os_log_type_enabled((os_log_t)qword_18C496D18, OS_LOG_TYPE_ERROR))
        {
          v27 = *(NSThread **)(*(void *)&buf[8] + 40LL);
          v28 = +[NSThread currentThread](&OBJC_CLASS___NSThread, "currentThread");
          v29 = +[NSThread callStackSymbols](&OBJC_CLASS___NSThread, "callStackSymbols");
          *(_DWORD *)v37 = 138544130;
          v38 = v6;
          __int16 v39 = 2114;
          v40 = v27;
          __int16 v41 = 2114;
          v42 = v28;
          __int16 v43 = 2114;
          v44 = v29;
          _os_log_error_impl( &dword_182EB1000,  v22,  OS_LOG_TYPE_ERROR,  "KVO ISSUE: %{public}@ -- Has called 'will' or 'did' for the same key in multiple threads, first will/did rec orded in thread %{public}@ -- in thread: %{public}@, backtrace: %{public}@",  v37,  0x2Au);
        }
      }

      _Block_object_dispose(&v31, 8);
      _Block_object_dispose(buf, 8);
    }
  }

void __66___NSKeyValueDebugging__object_trackChangeForKeyOrKeys_operation___block_invoke_82(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  v2 = (_NSKeyValueDidWillStats *)(id)[*(id *)(*(void *)(a1 + 32) + 16) objectForKeyedSubscript:*(void *)(a1 + 40)];
  uint64_t v3 = v2;
  if (!v2) {
    uint64_t v3 = objc_alloc_init(&OBJC_CLASS____NSKeyValueDidWillStats);
  }
  uint64_t v4 = *(void *)(a1 + 72);
  if (v4 == 1)
  {
    if (v3)
    {
      -[_NSKeyValueDidWillStats _recordThread](v3, "_recordThread");
      *(_WORD *)&v3->_hasDecreased = 1;
      uint64_t count = v3->_count;
      BOOL v7 = count < 1;
      uint64_t v5 = count - 1;
      v3->_uint64_t count = v5;
      char v8 = v7;
      v3->_detectedIssues.hasExcessiveDids = v8;
      goto LABEL_14;
    }
  }

  else if (v4)
  {
    if (v3)
    {
      uint64_t v5 = v3->_count;
      goto LABEL_14;
    }
  }

  else if (v3)
  {
    -[_NSKeyValueDidWillStats _recordThread](v3, "_recordThread");
    v3->_detectedIssues.hasBecomeReentrant = v3->_hasDecreased;
    v3->_hasDecreased = 0;
    uint64_t v5 = v3->_count + 1;
    v3->_uint64_t count = v5;
LABEL_14:
    if (v2) {
      BOOL v9 = 1;
    }
    else {
      BOOL v9 = v5 == 0;
    }
    if (v9)
    {
      if (v2) {
        BOOL v10 = v5 == 0;
      }
      else {
        BOOL v10 = 0;
      }
      if (v10) {
        [*(id *)(*(void *)(a1 + 32) + 16) removeObjectForKey:*(void *)(a1 + 40)];
      }
    }

    else
    {
      [*(id *)(*(void *)(a1 + 32) + 16) setObject:v3 forKeyedSubscript:*(void *)(a1 + 40)];
    }

    objc_copyStruct(&dest, &v3->_detectedIssues, 3LL, 1, 0);
    char v11 = 0;
    int v12 = LOWORD(dest.receiver) | (BYTE2(dest.receiver) << 16);
    goto LABEL_26;
  }

  if (v2) {
    [*(id *)(*(void *)(a1 + 32) + 16) removeObjectForKey:*(void *)(a1 + 40)];
  }
  int v12 = 0;
  char v11 = 1;
LABEL_26:
  uint64_t v13 = *(void *)(*(void *)(a1 + 56) + 8LL);
  *(_BYTE *)(v13 + 34) = BYTE2(v12);
  *(_WORD *)(v13 + 32) = v12;
  if (*(_BYTE *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 34LL))
  {
    if ((v11 & 1) != 0) {
      originalThread = 0LL;
    }
    else {
      originalThread = v3->_originalThread;
    }
    *(void *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 40LL) = originalThread;
  }

  if (*(void *)(a1 + 72))
  {
    uint64_t v15 = objc_alloc(&OBJC_CLASS____NSKeyValueReturnedValueConsistencyStats);
    if (v15)
    {
      uint64_t v16 = *(void **)(a1 + 40);
      dest.receiver = v15;
      dest.super_class = (Class)&OBJC_CLASS____NSKeyValueReturnedValueConsistencyStats;
      __int128 v17 = objc_msgSendSuper2(&dest, sel_init);
      if (v17) {
        v17[1] = [v16 copy];
      }
    }

    else
    {
      __int128 v17 = 0LL;
    }

    [*(id *)(*(void *)(a1 + 32) + 32) setObject:v17 forKeyedSubscript:*(void *)(a1 + 40)];
    [*(id *)(a1 + 48) addObject:v17];
  }

  else
  {
    [*(id *)(*(void *)(a1 + 32) + 32) removeObjectForKey:*(void *)(a1 + 40)];
  }

  uint64_t v18 = *(void *)(a1 + 32);
  if (!*(_BYTE *)(v18 + 24))
  {
    *(_BYTE *)(v18 + 24) = 1;
    v19[0] = MEMORY[0x1895F87A8];
    v19[1] = 3221225472LL;
    v19[2] = __66___NSKeyValueDebugging__object_trackChangeForKeyOrKeys_operation___block_invoke_2;
    v19[3] = &unk_189C9A030;
    v19[4] = *(void *)(a1 + 32);
    dispatch_async(MEMORY[0x1895F8AE0], v19);
  }

uint64_t __66___NSKeyValueDebugging__object_trackChangeForKeyOrKeys_operation___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) performSelector:sel__clearWillDidTable withObject:0 afterDelay:0.0];
}

void __66___NSKeyValueDebugging_object_willAddObserver_forKeyPath_context___block_invoke(void *a1)
{
  v4[1] = *MEMORY[0x1895F89C0];
  v2 = (void *)[*(id *)(a1[4] + 48) objectForKeyedSubscript:a1[5]];
  if (v2)
  {
    [v2 addObject:a1[6]];
  }

  else
  {
    v4[0] = a1[6];
    uint64_t v3 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x189603F18], "arrayWithObjects:count:", v4, 1), "mutableCopy");
    [*(id *)(a1[4] + 48) setObject:v3 forKeyedSubscript:a1[5]];
  }

void __66___NSKeyValueDebugging_object_willAddObserver_forKeyPath_context___block_invoke_2(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  uint64_t v10 = 0LL;
  char v11 = &v10;
  uint64_t v12 = 0x3052000000LL;
  uint64_t v13 = __Block_byref_object_copy__18;
  __int128 v14 = __Block_byref_object_dispose__18;
  uint64_t v15 = 0LL;
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  os_unfair_lock_lock((os_unfair_lock_t)(v3 + 8));
  id v4 = (id)[*(id *)(v3 + 48) objectForKeyedSubscript:v2];
  v11[5] = (uint64_t)v4;
  [*(id *)(v3 + 48) removeObjectForKey:v2];
  os_unfair_lock_unlock((os_unfair_lock_t)(v3 + 8));
  uint64_t v5 = [(id)v11[5] indexesOfObjectsPassingTest:&__block_literal_global_97];
  [(id)v11[5] removeObjectsAtIndexes:v5];
  if ([(id)v11[5] count])
  {
    if (_MergedGlobals_132) {
      NSLog( (NSString *)@"<KVODebugging> KVO ISSUE -- MAY CAUSE CRASHES -- An observer was deallocated before it removed itself from its outstanding observations, while those objects remain active in memory. Observer: %@, Outstanding observations: %@, Deallocated at: %@",  *(void *)(a1 + 40),  v11[5],  +[NSThread callStackSymbols](&OBJC_CLASS___NSThread, "callStackSymbols"));
    }
    if (qword_18C496D20 != -1) {
      dispatch_once(&qword_18C496D20, &__block_literal_global_143);
    }
    uint64_t v6 = (os_log_s *)qword_18C496D18;
    if (os_log_type_enabled((os_log_t)qword_18C496D18, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = *(void *)(a1 + 40);
      uint64_t v8 = v11[5];
      BOOL v9 = +[NSThread callStackSymbols](&OBJC_CLASS___NSThread, "callStackSymbols");
      *(_DWORD *)buf = 138543874;
      uint64_t v17 = v7;
      __int16 v18 = 2114;
      uint64_t v19 = v8;
      __int16 v20 = 2114;
      uint64_t v21 = v9;
      _os_log_error_impl( &dword_182EB1000,  v6,  OS_LOG_TYPE_ERROR,  "KVO ISSUE -- MAY CAUSE CRASHES -- An observer was deallocated before it removed itself from its outstanding obse rvations, while those objects remain active in memory. Observer: %{public}@, Outstanding observations: %{public} @, Deallocated at: %{public}@",  buf,  0x20u);
    }
  }

  _Block_object_dispose(&v10, 8);
}

BOOL __66___NSKeyValueDebugging_object_willAddObserver_forKeyPath_context___block_invoke_4( uint64_t a1,  BOOL a2)
{
  return -[_NSKeyValueObjectAndKeyPair objectWasDeallocated](a2);
}

uint64_t __69___NSKeyValueDebugging_object_willRemoveObserver_forKeyPath_context___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  id v2 = (id)objc_msgSend((id)objc_msgSend(*(id *)(*(void *)(a1 + 32) + 48), "allKeys"), "copy");
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  uint64_t result = [v2 countByEnumeratingWithState:&v15 objects:v14 count:16];
  if (result)
  {
    uint64_t v4 = result;
    uint64_t v5 = *(void *)v16;
    do
    {
      uint64_t v6 = 0LL;
      do
      {
        if (*(void *)v16 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v15 + 1) + 8 * v6);
        if (-[_NSKeyValueObjectAndKeyPair objectWasDeallocated](v7))
        {
LABEL_7:
          [*(id *)(*(void *)(a1 + 32) + 48) removeObjectForKey:v7];
          goto LABEL_13;
        }

        if (v7) {
          uint64_t v8 = *(void *)(v7 + 16);
        }
        else {
          uint64_t v8 = 0LL;
        }
        if (v8 == *(void *)(a1 + 40))
        {
          BOOL v9 = (void *)[*(id *)(*(void *)(a1 + 32) + 48) objectForKeyedSubscript:v7];
          v12[0] = MEMORY[0x1895F87A8];
          v12[1] = 3221225472LL;
          v12[2] = __69___NSKeyValueDebugging_object_willRemoveObserver_forKeyPath_context___block_invoke_2;
          v12[3] = &unk_189CA17D0;
          __int128 v13 = *(_OWORD *)(a1 + 48);
          uint64_t v10 = (void *)[v9 indexesOfObjectsPassingTest:v12];
          unint64_t v11 = [v10 count];
          if (v11 >= [v9 count]) {
            goto LABEL_7;
          }
          [v9 removeObjectsAtIndexes:v10];
        }

BOOL __69___NSKeyValueDebugging_object_willRemoveObserver_forKeyPath_context___block_invoke_2( uint64_t a1,  uint64_t a2)
{
  if (-[_NSKeyValueObjectAndKeyPair objectWasDeallocated](a2)) {
    return 1LL;
  }
  if (a2) {
    uint64_t v5 = *(void *)(a2 + 16);
  }
  else {
    uint64_t v5 = 0LL;
  }
  if (v5 != *(void *)(a1 + 32)) {
    return 0LL;
  }
  uint64_t v6 = *(void *)(a1 + 40);
  if (!v6) {
    return 1LL;
  }
  if (a2) {
    uint64_t v7 = *(void *)(a2 + 32);
  }
  else {
    uint64_t v7 = 0LL;
  }
  return v6 == v7;
}

@end