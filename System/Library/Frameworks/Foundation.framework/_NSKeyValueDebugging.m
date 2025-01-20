@interface _NSKeyValueDebugging
- (_NSKeyValueDebugging)init;
- (void)_checkConsistency;
- (void)_checkConsistencyForStatsWhileOutOfLock:(id)a3 forPair:(id)a4 timingDescription:(id)a5;
- (void)_clearWillDidTable;
- (void)_object:(id)a3 trackChangeForKeyOrKeys:(id)a4 operation:(int64_t)a5;
- (void)dealloc;
- (void)object:(void *)a3 willAddObserver:(void *)a4 forKeyPath:(uint64_t)a5 context:;
- (void)object:(void *)a3 willRemoveObserver:(uint64_t)a4 forKeyPath:(uint64_t)a5 context:;
@end

@implementation _NSKeyValueDebugging

- (_NSKeyValueDebugging)init
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS____NSKeyValueDebugging;
  v2 = -[_NSKeyValueDebugging init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    v2->_willDidCountTable = (NSMutableDictionary *)objc_opt_new();
    v3->_consistencyTable = (NSMutableDictionary *)objc_opt_new();
    v3->_observedKeyPathsByObserver = (NSMutableDictionary *)objc_opt_new();
    v4 = (NSTimer *)(id)[MEMORY[0x189604028] timerWithTimeInterval:v3 target:sel__checkConsistency selector:0 userInfo:1 repeats:1.0];
    uint64_t v5 = MEMORY[0x1895F87A8];
    v3->_consistencyCheckTimer = v4;
    v7[0] = v5;
    v7[1] = 3221225472LL;
    v7[2] = __28___NSKeyValueDebugging_init__block_invoke;
    v7[3] = &unk_189C9A030;
    v7[4] = v4;
    dispatch_async(MEMORY[0x1895F8AE0], v7);
  }

  return v3;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  -[NSTimer invalidate](self->_consistencyCheckTimer, "invalidate");

  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS____NSKeyValueDebugging;
  -[_NSKeyValueDebugging dealloc](&v3, sel_dealloc);
}

- (void)_clearWillDidTable
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  id v3 = objc_alloc_init(MEMORY[0x189603FC8]);
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __42___NSKeyValueDebugging__clearWillDidTable__block_invoke;
  v7[3] = &unk_189C991F0;
  v7[4] = self;
  void v7[5] = v3;
  os_unfair_lock_lock(&self->_lock);
  __42___NSKeyValueDebugging__clearWillDidTable__block_invoke((uint64_t)v7);
  os_unfair_lock_unlock(&self->_lock);
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v8 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v10;
    do
    {
      uint64_t v6 = 0LL;
      do
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v3);
        }
        -[_NSKeyValueDebugging _checkConsistencyForStatsWhileOutOfLock:forPair:timingDescription:]( self,  "_checkConsistencyForStatsWhileOutOfLock:forPair:timingDescription:",  [v3 objectForKeyedSubscript:*(void *)(*((void *)&v9 + 1) + 8 * v6)],  *(void *)(*((void *)&v9 + 1) + 8 * v6),  @"at the next run loop spin after the 'did'");
        ++v6;
      }

      while (v4 != v6);
      uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v8 count:16];
    }

    while (v4);
  }
}

- (void)_checkConsistencyForStatsWhileOutOfLock:(id)a3 forPair:(id)a4 timingDescription:(id)a5
{
  uint64_t v25 = *MEMORY[0x1895F89C0];
  if (_MergedGlobals_132) {
    NSLog((NSString *)@"<KVODebugging>: %@ -- Checking for consistency now (%@).", a2, a4, a5);
  }
  if (qword_18C496D20 != -1) {
    dispatch_once(&qword_18C496D20, &__block_literal_global_143);
  }
  __int128 v9 = (os_log_s *)qword_18C496D18;
  if (os_log_type_enabled((os_log_t)qword_18C496D18, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543618;
    id v20 = a4;
    __int16 v21 = 2114;
    id v22 = a5;
    _os_log_impl( &dword_182EB1000,  v9,  OS_LOG_TYPE_INFO,  "%{public}@ -- Checking for consistency now (%{public}@).",  buf,  0x16u);
  }

  if (a3)
  {
    ++*((void *)a3 + 5);
    __int128 v10 = -[_NSKeyValueObjectAndKeyPair newCurrentValue](*((_Unwind_Exception **)a3 + 1));
    if (!v10) {
      goto LABEL_26;
    }
    __int128 v11 = (_Unwind_Exception *)(id)[a3 currentValue];
    __int128 v12 = v11;
    if (*((void *)a3 + 4))
    {
      if ((-[_Unwind_Exception isEqual:](v11, "isEqual:", v10) & 1) != 0)
      {
LABEL_11:

        goto LABEL_26;
      }
    }

    else if (v11 == v10)
    {
      goto LABEL_11;
    }

    uint64_t v13 = v12;
    v14 = v10;
    [a3 setCurrentValue:v10];

    if (v12 && (v15 = _NSKeyValueRetainedObservationInfoForObject(v12, 0LL)) != 0LL)
    {

      if (_MergedGlobals_132) {
        NSLog( (NSString *)@"<KVODebugging> KVO ISSUE: %@ -- MAY CAUSE CRASHES -- The value for this key pair seems to have changed outside of a will/did pair AND IT IS OBSERVED BY OTHER OBJECTS!!!; last observed value was '%@', current value is '%@'",
      }
          a4,
          v13,
          v14);
      if (qword_18C496D20 != -1) {
        dispatch_once(&qword_18C496D20, &__block_literal_global_143);
      }
      v16 = (os_log_s *)qword_18C496D18;
      if (os_log_type_enabled((os_log_t)qword_18C496D18, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543874;
        id v20 = a4;
        __int16 v21 = 2114;
        id v22 = v13;
        __int16 v23 = 2114;
        v24 = v14;
        v17 = "KVO ISSUE: %{public}@ -- MAY CAUSE CRASHES -- The value for this key pair seems to have changed outside of"
              " a will/did pair AND IT IS OBSERVED BY OTHER OBJECTS!!!; last observed value was '%{public}@', current val"
              "ue is '%{public}@'";
LABEL_40:
        _os_log_error_impl(&dword_182EB1000, v16, OS_LOG_TYPE_ERROR, v17, buf, 0x20u);
      }
    }

    else
    {
      if (_MergedGlobals_132) {
        NSLog( (NSString *)@"<KVODebugging> KVO ISSUE: %@ -- The value for this key pair seems to have changed outside of a will/did pair, which makes this key unsafe to observe within a longer key path; last observed value was '%@', current value is '%@'",
      }
          a4,
          v13,
          v14);
      if (qword_18C496D20 != -1) {
        dispatch_once(&qword_18C496D20, &__block_literal_global_143);
      }
      v16 = (os_log_s *)qword_18C496D18;
      if (os_log_type_enabled((os_log_t)qword_18C496D18, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543874;
        id v20 = a4;
        __int16 v21 = 2114;
        id v22 = v13;
        __int16 v23 = 2114;
        v24 = v14;
        v17 = "KVO ISSUE: %{public}@ -- The value for this key pair seems to have changed outside of a will/did pair, whi"
              "ch makes this key unsafe to observe within a longer key path; last observed value was '%{public}@', curren"
              "t value is '%{public}@'";
        goto LABEL_40;
      }
    }

- (void)_checkConsistency
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  uint64_t v9 = 0LL;
  __int128 v10 = &v9;
  uint64_t v11 = 0x3052000000LL;
  __int128 v12 = __Block_byref_object_copy__18;
  uint64_t v13 = __Block_byref_object_dispose__18;
  uint64_t v14 = 0LL;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v4 = -[NSMutableDictionary copy](self->_consistencyTable, "copy");
  v10[5] = v4;
  os_unfair_lock_unlock(p_lock);
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  uint64_t v5 = (void *)v10[5];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v17;
    do
    {
      for (uint64_t i = 0LL; i != v6; ++i)
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v5);
        }
        -[_NSKeyValueDebugging _checkConsistencyForStatsWhileOutOfLock:forPair:timingDescription:]( self,  "_checkConsistencyForStatsWhileOutOfLock:forPair:timingDescription:",  [(id)v10[5] objectForKeyedSubscript:*(void *)(*((void *)&v16 + 1) + 8 * i)],  *(void *)(*((void *)&v16 + 1) + 8 * i),  @"periodically for a short time every second after the 'did'");
      }

      uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v15 count:16];
    }

    while (v6);
  }

  _Block_object_dispose(&v9, 8);
}

- (void)_object:(id)a3 trackChangeForKeyOrKeys:(id)a4 operation:(int64_t)a5
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  v11[0] = MEMORY[0x1895F87A8];
  v11[1] = 3221225472LL;
  __int128 v12 = __66___NSKeyValueDebugging__object_trackChangeForKeyOrKeys_operation___block_invoke;
  uint64_t v13 = &unk_189CA1740;
  v15 = self;
  int64_t v16 = a5;
  id v14 = a3;
  if ([a4 conformsToProtocol:&unk_18C65BC30])
  {
    __int128 v20 = 0u;
    __int128 v21 = 0u;
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    uint64_t v6 = [a4 countByEnumeratingWithState:&v18 objects:v17 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v19;
      do
      {
        for (uint64_t i = 0LL; i != v7; ++i)
        {
          if (*(void *)v19 != v8) {
            objc_enumerationMutation(a4);
          }
          __int128 v10 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        }

        uint64_t v7 = [a4 countByEnumeratingWithState:&v18 objects:v17 count:16];
      }

      while (v7);
    }
  }

  else if (_NSIsNSString())
  {
    __66___NSKeyValueDebugging__object_trackChangeForKeyOrKeys_operation___block_invoke((uint64_t)v11, a4);
  }

- (void)object:(void *)a3 willAddObserver:(void *)a4 forKeyPath:(uint64_t)a5 context:
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  if (a1)
  {
    __int128 v10 = objc_alloc(&OBJC_CLASS____NSKeyValueObjectBox);
    if (v10)
    {
      v19.receiver = v10;
      v19.super_class = (Class)&OBJC_CLASS____NSKeyValueObjectBox;
      uint64_t v11 = (id *)-[os_unfair_lock_s init](&v19, sel_init);
      if (v11)
      {
        if ((objc_opt_respondsToSelector() & 1) != 0
          && (objc_msgSend(a3, sel_allowsWeakReference) & 1) == 0)
        {
        }

        else
        {
          objc_storeWeak(v11 + 1, a3);
          void v11[2] = a3;
          v11[3] = object_getClass(a3);
          id v12 = -[_NSKeyValueObjectAndKeyPair initWithObject:key:context:]( objc_alloc(&OBJC_CLASS____NSKeyValueObjectAndKeyPair),  a2,  a4,  a5);
          uint64_t v13 = MEMORY[0x1895F87A8];
          v18[0] = MEMORY[0x1895F87A8];
          v18[1] = 3221225472LL;
          v18[2] = __66___NSKeyValueDebugging_object_willAddObserver_forKeyPath_context___block_invoke;
          v18[3] = &unk_189CA16F0;
          v18[4] = a1;
          v18[5] = v11;
          v18[6] = v12;
          os_unfair_lock_lock(a1 + 2);
          __66___NSKeyValueDebugging_object_willAddObserver_forKeyPath_context___block_invoke(v18);
          os_unfair_lock_unlock(a1 + 2);
          v17[0] = v13;
          v17[1] = 3221225472LL;
          v17[2] = __66___NSKeyValueDebugging_object_willAddObserver_forKeyPath_context___block_invoke_2;
          v17[3] = &unk_189CA17A8;
          v17[4] = a1;
          v17[5] = v11;
          uint64_t v14 = objc_opt_self();
          v15 = (void *)MEMORY[0x186E1FF60](v14);
          +[_NSKeyValueDebuggingDeallocSentinel _invalidateSentinelWithKey:fromObject:]( &OBJC_CLASS____NSKeyValueDebuggingDeallocSentinel,  "_invalidateSentinelWithKey:fromObject:",  &_NSKeyValueDebuggingObserverDeallocBeforeRemovalKey,  a3);
          int64_t v16 = -[_NSKeyValueDebuggingDeallocSentinel initWithObjectPointer:callbackBlock:]( objc_alloc(&OBJC_CLASS____NSKeyValueDebuggingDeallocSentinel),  "initWithObjectPointer:callbackBlock:",  a3,  v17);
          objc_setAssociatedObject(a3, &_NSKeyValueDebuggingObserverDeallocBeforeRemovalKey, v16, (void *)0x301);

          objc_autoreleasePoolPop(v15);
        }
      }
    }
  }

- (void)object:(void *)a3 willRemoveObserver:(uint64_t)a4 forKeyPath:(uint64_t)a5 context:
{
  v9[8] = *MEMORY[0x1895F89C0];
  if (a1)
  {
    [(id)objc_opt_self() _invalidateSentinelWithKey:&_NSKeyValueDebuggingObserverDeallocBeforeRemovalKey fromObject:a3];
    objc_setAssociatedObject(a3, &_NSKeyValueDebuggingObserverDeallocBeforeRemovalKey, 0LL, (void *)0x301);
    v9[0] = MEMORY[0x1895F87A8];
    v9[1] = 3221225472LL;
    v9[2] = __69___NSKeyValueDebugging_object_willRemoveObserver_forKeyPath_context___block_invoke;
    v9[3] = &unk_189CA17F8;
    v9[4] = a1;
    v9[5] = a3;
    v9[6] = a2;
    v9[7] = a5;
    os_unfair_lock_lock(a1 + 2);
    __69___NSKeyValueDebugging_object_willRemoveObserver_forKeyPath_context___block_invoke((uint64_t)v9);
    os_unfair_lock_unlock(a1 + 2);
  }

@end