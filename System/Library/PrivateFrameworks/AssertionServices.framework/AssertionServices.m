CFStringRef NSStringFromBKSProcessErrorCode(uint64_t a1)
{
  CFStringRef v1;
  v1 = @"(unknown)";
  if (a1 == 1) {
    v1 = @"bootstrap-failed";
  }
  if (a1) {
    return v1;
  }
  else {
    return @"none";
  }
}

__CFString *NSStringFromBKSProcessExitReason(char a1)
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if ((a1 & 1) != 0)
  {
    [v2 addObject:@"voluntary"];
    if ((a1 & 4) == 0)
    {
LABEL_3:
      if ((a1 & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }

  else if ((a1 & 4) == 0)
  {
    goto LABEL_3;
  }

  [v3 addObject:@"signal"];
  if ((a1 & 8) == 0)
  {
LABEL_4:
    if ((a1 & 2) == 0) {
      goto LABEL_5;
    }
    goto LABEL_14;
  }

LABEL_13:
  [v3 addObject:@"jetsam"];
  if ((a1 & 2) == 0)
  {
LABEL_5:
    if ((a1 & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_15;
  }
  }

  os_unfair_lock_unlock(p_lock);

  return v6;
}

LABEL_14:
  [v3 addObject:@"crash"];
  if ((a1 & 0x10) == 0)
  {
LABEL_6:
    if ((a1 & 0x20) == 0) {
      goto LABEL_7;
    }
    goto LABEL_16;
  }

LABEL_15:
  [v3 addObject:@"fairPlay"];
  if ((a1 & 0x20) == 0)
  {
LABEL_7:
    if ((a1 & 0x40) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }

LABEL_16:
  [v3 addObject:@"badSignature"];
  if ((a1 & 0x40) != 0) {
LABEL_8:
  }
    [v3 addObject:@"unknown"];
LABEL_9:
  if ([v3 count])
  {
    objc_msgSend(v3, "componentsJoinedByString:", @", ");
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    v4 = @"(none)";
  }

  return v4;
}

void sub_1862DD104( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
}

void BKSProcessAssertionSetExpirationHandler(void *a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  id v3 = a1;
  id v4 = a2;
  if (!v4)
  {
    [MEMORY[0x1896077D8] currentHandler];
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend( NSString,  "stringWithUTF8String:",  "void BKSProcessAssertionSetExpirationHandler(__strong dispatch_queue_t, void (^__strong)(void))");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    [v13 handleFailureInFunction:v14, @"BKSProcessAssertion.m", 364, @"Invalid parameter not satisfying: %@", @"handler != nil" file lineNumber description];
  }

  if (BKSProcessAssertionSetExpirationHandler_onceToken != -1) {
    dispatch_once(&BKSProcessAssertionSetExpirationHandler_onceToken, &__block_literal_global_1);
  }
  v5 = (void *)MEMORY[0x186E36B54]();
  v6 = (void *)MEMORY[0x1896122D0];
  v15[0] = MEMORY[0x1895F87A8];
  v15[1] = 3221225472LL;
  v15[2] = __BKSProcessAssertionSetExpirationHandler_block_invoke_2;
  v15[3] = &unk_189E3B468;
  id v7 = v4;
  id v17 = v7;
  id v8 = v3;
  id v16 = v8;
  [v6 observeForImminentAssertionsExpiration:v15];
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  rbs_shim_log();
  v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v9)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v12 = (void *)MEMORY[0x186E36CA4](v7);
      *(_DWORD *)buf = 138412546;
      v19 = v12;
      __int16 v20 = 2112;
      v21 = v9;
      _os_log_impl( &dword_1862D9000,  v11,  OS_LOG_TYPE_DEFAULT,  "adding imminent expiration handler: %@, observer %@",  buf,  0x16u);
    }

    os_unfair_lock_lock((os_unfair_lock_t)&BKSProcessAssertionSetExpirationHandler_lock);
    [(id)BKSProcessAssertionSetExpirationHandler__observers addObject:v9];
    os_unfair_lock_unlock((os_unfair_lock_t)&BKSProcessAssertionSetExpirationHandler_lock);
  }

  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      BKSProcessAssertionSetExpirationHandler_cold_1(v11);
    }
  }

  objc_autoreleasePoolPop(v5);
}

void __BKSProcessAssertionSetExpirationHandler_block_invoke()
{
  uint64_t v0 = [objc_alloc(MEMORY[0x189603FA8]) initWithCapacity:2];
  v1 = (void *)BKSProcessAssertionSetExpirationHandler__observers;
  BKSProcessAssertionSetExpirationHandler__observers = v0;
}

void __BKSProcessAssertionSetExpirationHandler_block_invoke_2(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  rbs_shim_log();
  v2 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = (void *)MEMORY[0x186E36CA4](*(void *)(a1 + 40));
    int v6 = 138412290;
    id v7 = v3;
    _os_log_impl( &dword_1862D9000,  v2,  OS_LOG_TYPE_DEFAULT,  "BKSProcessAssertionSetExpirationHandler fired: %@",  (uint8_t *)&v6,  0xCu);
  }

  id v4 = *(dispatch_queue_s **)(a1 + 32);
  v5 = *(void (***)(void))(a1 + 40);
  if (v4) {
    dispatch_async(v4, v5);
  }
  else {
    v5[2](*(void *)(a1 + 40));
  }
}

void BKSProcessAssertionBackgroundTimeRemaining()
{
  uint64_t v0 = (void *)objc_claimAutoreleasedReturnValue();
  [v0 activeLimitations];
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  [v1 runTime];
}

void OUTLINED_FUNCTION_0( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

  ;
}
}

LABEL_25:
      }

      id v17 = [v15 countByEnumeratingWithState:&v69 objects:v78 count:16];
    }

    while (v17);
  }

  v50 = v15;

  v63 = 0u;
  v64 = 0u;
  v61 = 0u;
  v62 = 0u;
  v32 = v49;
  v33 = [v32 countByEnumeratingWithState:&v61 objects:v77 count:16];
  if (v33)
  {
    v34 = v33;
    v35 = *(void *)v62;
    v54 = *MEMORY[0x1896075F0];
    do
    {
      for (k = 0LL; k != v34; ++k)
      {
        if (*(void *)v62 != v35) {
          objc_enumerationMutation(v32);
        }
        v37 = *(void *)(*((void *)&v61 + 1) + 8 * k);
        v38 = (void *)MEMORY[0x1896122D0];
        [MEMORY[0x189612320] predicateMatchingBundleIdentifier:v37];
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v60 = 0LL;
        [v38 handleForPredicate:v39 error:&v60];
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = v60;

        if (v40)
        {
          [v40 currentState];
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          v43 = [v42 isRunning];

          if ((v43 & 1) == 0) {
            goto LABEL_40;
          }
        }

        else
        {
          [v41 userInfo];
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          [v44 objectForKeyedSubscript:v54];
          v45 = (__CFString *)objc_claimAutoreleasedReturnValue();
          if (v45 == @"Specified predicate matched multiple processes") {
            goto LABEL_41;
          }
          v46 = v45;
          if (!v45)
          {

LABEL_40:
            v48 = *(dispatch_queue_s **)(*(void *)(v56 + 32) + 40LL);
            v57[0] = MEMORY[0x1895F87A8];
            v57[1] = 3221225472LL;
            v57[2] = __56__BKSTerminationAssertionObserverManager__createMonitor__block_invoke_4;
            v57[3] = &unk_189E3B490;
            v58 = v55;
            v59 = v37;
            dispatch_async(v48, v57);
            v44 = v58;
LABEL_41:

            goto LABEL_42;
          }

          v47 = -[__CFString isEqual:](v45, "isEqual:", @"Specified predicate matched multiple processes");

          if ((v47 & 1) == 0) {
            goto LABEL_40;
          }
        }

LABEL_42:
      }

      v34 = [v32 countByEnumeratingWithState:&v61 objects:v77 count:16];
    }

    while (v34);
  }
}

uint64_t BKSTerminationAssertionActiveEfficacyForBundleIdentifier(void *a1)
{
  id v1 = a1;
  __observerManager();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [v2 efficacyForBundleID:v1];

  return v3;
}

id __observerManager()
{
  if (__observerManager_onceToken != -1) {
    dispatch_once(&__observerManager_onceToken, &__block_literal_global_2);
  }
  return (id)__observerManager___manager;
}

uint64_t BKSTerminationAssertionHeldForBundleIdentifier(void *a1)
{
  id v1 = a1;
  __observerManager();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [v2 hasTerminationAssertionForBundleID:v1];

  return v3;
}

void BKSTerminationAssertionRegisterObserver(void *a1)
{
  id v1 = a1;
  __observerManager();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v2 addObserver:v1];
}

void BKSTerminationAssertionUnregisterObserver(void *a1)
{
  id v1 = a1;
  __observerManager();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v2 removeObserver:v1];
}

void sub_1862DECB8( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
}

uint64_t __Block_byref_object_copy_(uint64_t a1, uint64_t a2)
{
  uint64_t result = MEMORY[0x186E36CA4](*(void *)(a2 + 40));
  *(void *)(a1 + 40) = result;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

uint64_t __Block_byref_object_copy__46(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void __Block_byref_object_dispose__47(uint64_t a1)
{
}

void ____observerManager_block_invoke()
{
  uint64_t v0 = objc_alloc_init(&OBJC_CLASS___BKSTerminationAssertionObserverManager);
  id v1 = (void *)__observerManager___manager;
  __observerManager___manager = (uint64_t)v0;
}

id RBSProcessLegacyStateDescriptor()
{
  if (RBSProcessLegacyStateDescriptor_onceToken != -1) {
    dispatch_once(&RBSProcessLegacyStateDescriptor_onceToken, &__block_literal_global_3);
  }
  return (id)RBSProcessLegacyStateDescriptor___LegacyDescriptor;
}

void __RBSProcessLegacyStateDescriptor_block_invoke()
{
  v4[1] = *MEMORY[0x1895F89C0];
  uint64_t v0 = [MEMORY[0x189612348] descriptor];
  id v1 = (void *)RBSProcessLegacyStateDescriptor___LegacyDescriptor;
  RBSProcessLegacyStateDescriptor___LegacyDescriptor = v0;

  [(id)RBSProcessLegacyStateDescriptor___LegacyDescriptor setValues:9];
  id v2 = (void *)RBSProcessLegacyStateDescriptor___LegacyDescriptor;
  v4[0] = *MEMORY[0x189612510];
  [MEMORY[0x189603F18] arrayWithObjects:v4 count:1];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 setEndowmentNamespaces:v3];
}

void sub_1862E066C(_Unwind_Exception *a1)
{
}

uint64_t _BKSWatchdogAssertionGetTypeID()
{
  if (_BKSWatchdogAssertionGetTypeID_once != -1) {
    dispatch_once(&_BKSWatchdogAssertionGetTypeID_once, &__block_literal_global_4);
  }
  return _BKSWatchdogAssertionGetTypeID_typeID;
}

void _BKSWatchdogAssertionDestroy(uint64_t a1)
{
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [(id)assertionsByIdentifier objectForKey:v3];
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 invalidate];
  [(id)assertionsByIdentifier removeObjectForKey:v3];
  os_unfair_lock_unlock((os_unfair_lock_t)&watchdogLock);
}

BOOL _BKSWatchdogAssertionEqual(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

CFStringRef _BKSWatchdogAssertionDescribe(unsigned int *a1)
{
  uint64_t v2 = CFGetAllocator(a1);
  return CFStringCreateWithFormat(v2, 0LL, @"<BKSWatchdogAssertion %p> pid = %d", a1, a1[4]);
}

uint64_t BKSWatchdogAssertionCreateForPID(uint64_t a1, uint64_t a2)
{
  int v2 = a2;
  v18[2] = *MEMORY[0x1895F89C0];
  [MEMORY[0x189612388] targetWithPid:a2];
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  id v4 = objc_alloc(MEMORY[0x189612158]);
  [MEMORY[0x1896121C8] grant];
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v5;
  [MEMORY[0x189612118] attributeWithCompletionPolicy:0];
  int v6 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v6;
  [MEMORY[0x189603F18] arrayWithObjects:v18 count:2];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = (void *)[v4 initWithExplanation:@"BKSWatchdogAssertion" target:v3 attributes:v7];

  id v17 = 0LL;
  LODWORD(v7) = [v8 acquireWithError:&v17];
  id v9 = v17;
  uint64_t Instance = 0LL;
  if ((_DWORD)v7)
  {
    if (_BKSWatchdogAssertionGetTypeID_once != -1) {
      dispatch_once(&_BKSWatchdogAssertionGetTypeID_once, &__block_literal_global_4);
    }
    uint64_t Instance = _CFRuntimeCreateInstance();
    *(_DWORD *)(Instance + 16) = v2;
    os_unfair_lock_lock((os_unfair_lock_t)&watchdogLock);
    uint64_t v11 = nextIdentifier++;
    *(void *)(Instance + 24) = v11;
    v12 = (void *)assertionsByIdentifier;
    if (!assertionsByIdentifier)
    {
      uint64_t v13 = [MEMORY[0x189603FC8] dictionary];
      v14 = (void *)assertionsByIdentifier;
      assertionsByIdentifier = v13;

      v12 = (void *)assertionsByIdentifier;
      uint64_t v11 = *(void *)(Instance + 24);
    }

    [MEMORY[0x189607968] numberWithUnsignedLongLong:v11];
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    [v12 setObject:v8 forKey:v15];

    os_unfair_lock_unlock((os_unfair_lock_t)&watchdogLock);
  }

  return Instance;
}

void BKSProcessAssertionSetExpirationHandler_cold_1(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_fault_impl(&dword_1862D9000, log, OS_LOG_TYPE_FAULT, "unable to create assertion expiration observer", v1, 2u);
}

CFAllocatorRef CFGetAllocator(CFTypeRef cf)
{
  return (CFAllocatorRef)MEMORY[0x189602D18](cf);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x189603490](alloc, formatOptions, format);
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x189607458](aClassName);
}

uint64_t RBSServiceInitialize()
{
  return MEMORY[0x1896124D8]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _CFRuntimeCreateInstance()
{
  return MEMORY[0x189604550]();
}

uint64_t _CFRuntimeRegisterClass()
{
  return MEMORY[0x189604568]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

void _os_log_error_impl( void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl( void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1895FAEE8](when, delta);
}

uid_t geteuid(void)
{
  return MEMORY[0x1895FB540]();
}

uid_t getuid(void)
{
  return MEMORY[0x1895FB6E8]();
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1896165B0](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1896165C0]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1896165D8](a1);
}

void objc_autoreleasePoolPop(void *context)
{
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x1896165E8]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1896165F0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x189616600]();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1896166D8](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x189616700](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x189616728](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x189616730]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x189616738]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x189616818](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x189616828](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x189616830](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x189616838](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x189616990](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1895FC470](oslog, type);
}

void os_unfair_lock_assert_owner(os_unfair_lock_t lock)
{
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t rbs_general_log()
{
  return MEMORY[0x189612530]();
}

uint64_t rbs_shim_log()
{
  return MEMORY[0x189612570]();
}