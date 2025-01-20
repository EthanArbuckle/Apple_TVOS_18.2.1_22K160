@interface __NSOperationInternalObserver
+ (void)_observeValueForKeyPath:(id)a3 ofObject:(id)a4 changeKind:(unint64_t)a5 oldValue:(id)a6 newValue:(id)a7 indexes:(id)a8 context:(void *)a9;
@end

@implementation __NSOperationInternalObserver

+ (void)_observeValueForKeyPath:(id)a3 ofObject:(id)a4 changeKind:(unint64_t)a5 oldValue:(id)a6 newValue:(id)a7 indexes:(id)a8 context:(void *)a9
{
  uint64_t v91 = *MEMORY[0x1895F89C0];
  if (a3 != @"isFinished" && a3 != @"finished")
  {
    if (a3 == @"isExecuting" || a3 == @"executing")
    {
LABEL_18:
      int v15 = [a4 isExecuting];
      os_unfair_lock_lock((os_unfair_lock_t)a4 + 58);
      unsigned int v16 = atomic_load((unsigned __int8 *)a4 + 237);
      if (v16 <= 0xDF && v15 != 0) {
        atomic_store(0xE0u, (unsigned __int8 *)a4 + 237);
      }
      v18 = (os_unfair_lock_s *)((char *)a4 + 232);
      goto LABEL_24;
    }

    if (a3 == @"isReady" || a3 == @"ready")
    {
LABEL_108:
      int v60 = [a4 isReady];
      atomic_store(v60, (unsigned __int8 *)a4 + 239);
      os_unfair_lock_lock((os_unfair_lock_t)a4 + 58);
      id obja = *((id *)a4 + 4);
      os_unfair_lock_unlock((os_unfair_lock_t)a4 + 58);
      v61 = obja;
      if (v60 && obja)
      {
        __NSOQSchedule((uint64_t)obja);
        v61 = obja;
      }

      return;
    }

    if ((objc_msgSend(a3, "isEqualToString:", @"isFinished", a4, a5, a6, a7, a8) & 1) == 0
      && ([a3 isEqualToString:@"finished"] & 1) == 0)
    {
      if (([a3 isEqualToString:@"isExecuting"] & 1) != 0
        || ([a3 isEqualToString:@"executing"] & 1) != 0)
      {
        goto LABEL_18;
      }

      if (([a3 isEqualToString:@"isReady"] & 1) == 0
        && ([a3 isEqualToString:@"ready"] & 1) == 0)
      {
        return;
      }

      goto LABEL_108;
    }
  }

  os_unfair_lock_lock((os_unfair_lock_t)a4 + 58);
  unsigned int v11 = atomic_load((unsigned __int8 *)a4 + 237);
  if (*((void *)a4 + 4) && v11 <= 0xD7)
  {
    v12 = (objc_class *)objc_opt_class();
    Name = class_getName(v12);
    NSLog((NSString *)@"*** %s %p went isFinished=YES without being started by the queue it is in", Name, a4);
  }

  else if (v11 > 0xEF)
  {
    if (v11 == 244)
    {
      v18 = (os_unfair_lock_s *)((char *)a4 + 232);
LABEL_24:
      os_unfair_lock_unlock(v18);
      return;
    }

    goto LABEL_27;
  }

  atomic_store(0xF0u, (unsigned __int8 *)a4 + 237);
LABEL_27:
  v19 = (void *)*((void *)a4 + 6);
  *((void *)a4 + 6) = 0LL;
  obuint64_t j = v19;
  if ([v19 count]
    && (__int128 v89 = 0u,
        __int128 v90 = 0u,
        __int128 v87 = 0u,
        __int128 v88 = 0u,
        (uint64_t v20 = [v19 countByEnumeratingWithState:&v87 objects:v86 count:16]) != 0))
  {
    uint64_t v21 = v20;
    v22 = 0LL;
    uint64_t v23 = *(void *)v88;
    do
    {
      for (uint64_t i = 0LL; i != v21; ++i)
      {
        if (*(void *)v88 != v23) {
          objc_enumerationMutation(obj);
        }
        uint64_t v25 = *(void *)(*((void *)&v87 + 1) + 8 * i);
        os_unfair_lock_lock((os_unfair_lock_t)(v25 + 232));
        uint64_t v26 = *(void *)(v25 + 56);
        if (v26 == 1)
        {
          if (!v22) {
            v22 = (void *)objc_opt_new();
          }
          [v22 addObject:v25];
        }

        else if (v26 < 2)
        {
          if (v26) {
            __assert_rtn( "+[__NSOperationInternalObserver _observeValueForKeyPath:ofObject:changeKind:oldValue:newValue:indexes:context:]",  "NSOperation.m",  1022,  "idown->__unfinished_deps == 0");
          }
          unsigned __int8 v27 = atomic_load((unsigned __int8 *)(v25 + 240));
          if ((v27 & 1) == 0) {
            __assert_rtn( "+[__NSOperationInternalObserver _observeValueForKeyPath:ofObject:changeKind:oldValue:newValue:indexes:context:]",  "NSOperation.m",  1023,  "atomic_load(&idown->__isCancelled) == YES");
          }
        }

        else
        {
          *(void *)(v25 + 56) = v26 - 1;
        }

        os_unfair_lock_unlock((os_unfair_lock_t)(v25 + 232));
      }

      uint64_t v21 = [obj countByEnumeratingWithState:&v87 objects:v86 count:16];
    }

    while (v21);
  }

  else
  {
    v22 = 0LL;
  }

  unsigned int v63 = v11;
  atomic_store(0xF4u, (unsigned __int8 *)a4 + 237);
  v62 = (unsigned __int8 *)*((void *)a4 + 4);
  v64 = (char *)a4;
  lock = (os_unfair_lock_s *)((char *)a4 + 232);
  *((void *)a4 + 4) = 0LL;
  os_unfair_lock_unlock((os_unfair_lock_t)a4 + 58);
  if ([v22 count])
  {
    __int128 v84 = 0u;
    __int128 v85 = 0u;
    __int128 v82 = 0u;
    __int128 v83 = 0u;
    uint64_t v28 = [v22 countByEnumeratingWithState:&v82 objects:v81 count:16];
    if (v28)
    {
      uint64_t v29 = v28;
      uint64_t v30 = *(void *)v83;
      do
      {
        for (uint64_t j = 0LL; j != v29; ++j)
        {
          if (*(void *)v83 != v30) {
            objc_enumerationMutation(v22);
          }
          v32 = *(unsigned __int8 **)(*((void *)&v82 + 1) + 8 * j);
          v69[0] = MEMORY[0x1895F87A8];
          v69[1] = 3221225472LL;
          v70 = __111____NSOperationInternalObserver__observeValueForKeyPath_ofObject_changeKind_oldValue_newValue_indexes_context___block_invoke;
          v71 = &__block_descriptor_40_e5_v8__0l;
          v72 = v32 + 8;
          if (atomic_load(v32 + 244))
          {
            [v32 _changeValueForKeys:&_NSOperationReadyKeys count:1 maybeOldValuesDict:0 maybeNewValuesDict:0 usingBlock:v69];
          }

          else
          {
            v70((uint64_t)v69);
            +[__NSOperationInternalObserver _observeValueForKeyPath:ofObject:changeKind:oldValue:newValue:indexes:context:]( &OBJC_CLASS_____NSOperationInternalObserver,  "_observeValueForKeyPath:ofObject:changeKind:oldValue:newValue:indexes:context:",  @"isReady",  v32,  0LL,  0LL,  0LL,  0LL,  0LL);
          }
        }

        uint64_t v29 = [v22 countByEnumeratingWithState:&v82 objects:v81 count:16];
      }

      while (v29);
    }
  }

  pthread_mutex_lock((pthread_mutex_t *)(v64 + 120));
  pthread_cond_broadcast((pthread_cond_t *)(v64 + 184));
  pthread_mutex_unlock((pthread_mutex_t *)(v64 + 120));
  if (qword_18C496390 != -1) {
    dispatch_once(&qword_18C496390, &__block_literal_global_307);
  }
  os_unfair_lock_lock(lock);
  v34 = (void *)*((void *)v64 + 8);
  if (_MergedGlobals_13) {
    *((void *)v64 + 8) = 0LL;
  }
  else {
    id v35 = v34;
  }
  os_unfair_lock_unlock(lock);
  if (v34)
  {
    v36 = v64;
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(21LL, 0LL);
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __111____NSOperationInternalObserver__observeValueForKeyPath_ofObject_changeKind_oldValue_newValue_indexes_context___block_invoke_2;
    block[3] = &unk_189C9E898;
    block[4] = v64;
    block[5] = v34;
    dispatch_async(global_queue, block);
  }

  if (!v64[236]) {
    goto LABEL_87;
  }
  v38 = v64;
  char v39 = 0;
  uint64_t v40 = 0LL;
  uint64_t v73 = MEMORY[0x1895F87A8];
  uint64_t v74 = 3221225472LL;
  v75 = __iop_removeAllDependencies_block_invoke;
  v76 = &unk_189C9E2F8;
  v77 = (unsigned __int8 *)v64;
  v78 = v64 + 8;
  char v41 = 1;
  char v42 = 1;
  do
  {
    while (1)
    {
      while (1)
      {
        char v43 = v39;
        char v44 = v42;
        char v45 = v41;
        v46 = _NSOperationDependenciesAndReadyKeys[v40];
        if (v46 != @"isReady") {
          break;
        }
        char v42 = 0;
        int v47 = atomic_load((unsigned __int8 *)v64 + 244);
        char v48 = v39 | (v47 != 0);
        char v39 = 1;
        char v41 = v44;
        uint64_t v40 = 1LL;
        if ((v48 & 1) != 0) {
          goto LABEL_77;
        }
      }

      if (v46 != @"isFinished") {
        break;
      }
      char v42 = 0;
      v49 = (unsigned __int8 *)(v64 + 243);
LABEL_76:
      int v47 = atomic_load(v49);
      char v50 = v39 | (v47 != 0);
      uint64_t v40 = 1LL;
      char v41 = v44;
      char v39 = 1;
      if ((v50 & 1) != 0)
      {
LABEL_77:
        if (v47) {
          char v51 = v45;
        }
        else {
          char v51 = v44;
        }
        if ((v51 & 1) != 0) {
          goto LABEL_81;
        }
        goto LABEL_85;
      }
    }

    if (v46 == @"isExecuting")
    {
      char v42 = 0;
      v49 = (unsigned __int8 *)(v64 + 242);
      goto LABEL_76;
    }

    if (v46 == @"isCancelled")
    {
      char v42 = 0;
      v49 = (unsigned __int8 *)(v64 + 245);
      goto LABEL_76;
    }

    char v42 = 0;
    uint64_t v40 = 1LL;
    char v41 = v44;
    char v39 = 1;
  }

  while ((v43 & 1) == 0);
  if ((v44 & 1) != 0)
  {
LABEL_81:
    [v64 _changeValueForKeys:_NSOperationDependenciesAndReadyKeys count:2 maybeOldValuesDict:0 maybeNewValuesDict:0 usingBlock:&v73];
    goto LABEL_86;
  }

@end