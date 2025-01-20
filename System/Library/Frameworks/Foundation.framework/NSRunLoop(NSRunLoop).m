@interface NSRunLoop(NSRunLoop)
+ (id)_new:()NSRunLoop;
+ (uint64_t)currentRunLoop;
+ (uint64_t)mainRunLoop;
- (CFArrayRef)allModes;
- (CFStringRef)description;
- (__CFRunLoop)currentMode;
- (id)dealloc;
- (uint64_t)_addPort:()NSRunLoop forMode:;
- (uint64_t)_containsPort:()NSRunLoop forMode:;
- (uint64_t)_enumerateInfoPairsWithBlock:()NSRunLoop;
- (uint64_t)_portInvalidated:()NSRunLoop;
- (uint64_t)_removePort:()NSRunLoop forMode:;
- (uint64_t)acceptInputForMode:()NSRunLoop beforeDate:;
- (uint64_t)addPort:()NSRunLoop forMode:;
- (uint64_t)containsPort:()NSRunLoop forMode:;
- (uint64_t)containsTimer:()NSRunLoop forMode:;
- (uint64_t)init;
- (uint64_t)limitDateForMode:()NSRunLoop;
- (uint64_t)performBlock:()NSRunLoop;
- (uint64_t)portsForMode:()NSRunLoop;
- (uint64_t)removePort:()NSRunLoop forMode:;
- (uint64_t)run;
- (uint64_t)runBeforeDate:()NSRunLoop;
- (uint64_t)runMode:()NSRunLoop untilDate:;
- (uint64_t)timersForMode:()NSRunLoop;
- (void)_wakeup;
- (void)addTimer:()NSRunLoop forMode:;
- (void)performInModes:()NSRunLoop block:;
- (void)removeTimer:()NSRunLoop forMode:;
- (void)runMode:()NSRunLoop beforeDate:;
- (void)runUntilDate:()NSRunLoop;
@end

@implementation NSRunLoop(NSRunLoop)

- (void)runMode:()NSRunLoop beforeDate:
{
  v5 = a3;
  if (!a3 && _CFExecutableLinkedOnOrAfter())
  {
    v11 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: mode argument cannot be nil", _NSMethodExceptionProem(a1, a2)), 0 reason userInfo];
    objc_exception_throw(v11);
    -[NSConcreteData dealloc](v12, v13);
  }

  else if (-[objc_class getCFRunLoop](a1, "getCFRunLoop") && _CFRunLoopIsCurrent())
  {
    if (!_CFRunLoopFinished())
    {
      _CFAutoreleasePoolPush();
      [a4 timeIntervalSinceReferenceDate];
      double v9 = v8;
      CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
      CFRunLoopRunInMode(v5, v9 - Current, 1u);
      _CFAutoreleasePoolPop();
    }
  }

+ (uint64_t)currentRunLoop
{
  uint64_t v0 = _CFRunLoopGet2();
  _CFAutoreleasePoolPop();
  return v0;
}

- (uint64_t)_enumerateInfoPairsWithBlock:()NSRunLoop
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  char v11 = 0;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  v4 = (void *)[a1 _info];
  uint64_t result = [v4 countByEnumeratingWithState:&v13 objects:v12 count:16];
  if (result)
  {
    uint64_t v6 = result;
    uint64_t v7 = 0LL;
    uint64_t v8 = 0LL;
    uint64_t v9 = *(void *)v14;
    do
    {
      uint64_t v10 = 0LL;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v4);
        }
        if ((((_DWORD)v8 + (_DWORD)v10) & 1) != 0)
        {
          uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, void, uint64_t, char *))(a3 + 16))( a3,  v7,  *(void *)(*((void *)&v13 + 1) + 8 * v10),  v8 + v10 - 1,  &v11);
          if (v11) {
            return result;
          }
        }

        else
        {
          uint64_t v7 = *(void *)(*((void *)&v13 + 1) + 8 * v10);
        }

        ++v10;
      }

      while (v6 != v10);
      uint64_t result = [v4 countByEnumeratingWithState:&v13 objects:v12 count:16];
      uint64_t v6 = result;
      v8 += v10;
    }

    while (result);
  }

  return result;
}

- (uint64_t)_portInvalidated:()NSRunLoop
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  objc_sync_enter(a1);
  _CFAutoreleasePoolPush();
  id v5 = (id)[a3 object];
  uint64_t v6 = (void *)[MEMORY[0x189603FE0] set];
  uint64_t v7 = +[NSIndexSet indexSet](&OBJC_CLASS___NSMutableIndexSet, "indexSet");
  v12[0] = MEMORY[0x1895F87A8];
  v12[1] = 3221225472LL;
  v12[2] = __41__NSRunLoop_NSRunLoop___portInvalidated___block_invoke;
  v12[3] = &unk_189CA0908;
  v12[4] = v5;
  v12[5] = v6;
  v12[6] = v7;
  [a1 _enumerateInfoPairsWithBlock:v12];
  objc_msgSend((id)objc_msgSend(a1, "_info"), "removeObjectsAtIndexes:", v7);
  while (objc_msgSend((id)objc_msgSend(a1, "_ports"), "member:", v5))
    objc_msgSend((id)objc_msgSend(a1, "_ports"), "removeObject:", v5);
  -[NSNotificationCenter removeObserver:name:object:]( +[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"),  "removeObserver:name:object:",  a1,  @"NSPortDidBecomeInvalidNotification",  v5);
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v13 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0LL; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        [v5 removeFromRunLoop:a1 forMode:*(void *)(*((void *)&v14 + 1) + 8 * i)];
      }

      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v13 count:16];
    }

    while (v8);
  }

  _CFAutoreleasePoolPop();
  return objc_sync_exit(a1);
}

- (uint64_t)_containsPort:()NSRunLoop forMode:
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  uint64_t v10 = 0LL;
  char v11 = &v10;
  uint64_t v12 = 0x2020000000LL;
  char v13 = 0;
  objc_sync_enter(a1);
  v9[0] = MEMORY[0x1895F87A8];
  v9[1] = 3221225472LL;
  v9[2] = __46__NSRunLoop_NSRunLoop___containsPort_forMode___block_invoke;
  v9[3] = &unk_189CA0930;
  v9[4] = a3;
  v9[5] = a4;
  v9[6] = &v10;
  [a1 _enumerateInfoPairsWithBlock:v9];
  objc_sync_exit(a1);
  uint64_t v7 = *((unsigned __int8 *)v11 + 24);
  _Block_object_dispose(&v10, 8);
  return v7;
}

- (uint64_t)_addPort:()NSRunLoop forMode:
{
  if (a3 && !objc_msgSend((id)objc_msgSend(a1, "_ports"), "member:", a3))
  {
    -[NSNotificationCenter addObserver:selector:name:object:]( +[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"),  "addObserver:selector:name:object:",  a1,  sel__portInvalidated_,  @"NSPortDidBecomeInvalidNotification",  a3);
    int v7 = 1;
  }

  else
  {
    int v7 = [a1 _containsPort:a3 forMode:a4] ^ 1;
  }

  objc_msgSend((id)objc_msgSend(a1, "_ports"), "addObject:", a3);
  objc_msgSend((id)objc_msgSend(a1, "_info"), "addObject:", a3);
  uint64_t v8 = (void *)[a4 copy];
  objc_msgSend((id)objc_msgSend(a1, "_info"), "addObject:", v8);

  if (v7) {
    [a3 scheduleInRunLoop:a1 forMode:v8];
  }
  _CFAutoreleasePoolPop();
  return objc_sync_exit(a1);
}

- (uint64_t)_removePort:()NSRunLoop forMode:
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  objc_sync_enter(a1);
  _CFAutoreleasePoolPush();
  id v7 = a3;
  uint64_t v16 = 0LL;
  __int128 v17 = &v16;
  uint64_t v18 = 0x2020000000LL;
  uint64_t v19 = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v12 = 0LL;
  char v13 = &v12;
  uint64_t v14 = 0x2020000000LL;
  char v15 = 0;
  v11[0] = MEMORY[0x1895F87A8];
  v11[1] = 3221225472LL;
  v11[2] = __44__NSRunLoop_NSRunLoop___removePort_forMode___block_invoke;
  v11[3] = &unk_189CA0958;
  v11[4] = a3;
  v11[5] = a4;
  v11[6] = &v16;
  v11[7] = &v12;
  [a1 _enumerateInfoPairsWithBlock:v11];
  if (v17[3] != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v8 = (void *)[a1 _info];
    objc_msgSend(v8, "removeObjectsInRange:", v17[3], 2);
  }

  uint64_t v9 = (void *)[a1 _ports];
  [v9 removeObject:a3];
  if (![v9 countForObject:a3]) {
    -[NSNotificationCenter removeObserver:name:object:]( +[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"),  "removeObserver:name:object:",  a1,  @"NSPortDidBecomeInvalidNotification",  a3);
  }
  if (*((_BYTE *)v13 + 24)) {
    [a3 removeFromRunLoop:a1 forMode:a4];
  }
  _CFAutoreleasePoolPop();
  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v16, 8);
  return objc_sync_exit(a1);
}

+ (id)_new:()NSRunLoop
{
  v4 = (objc_class *)objc_opt_self();
  id v5 = NSAllocateObject(v4, 0LL, 0LL);
  uint64_t v6 = objc_opt_new();
  uint64_t v7 = objc_opt_new();
  uint64_t v8 = objc_opt_new();
  [v5 _initWithRl:a3 dperf:v6 perft:v7 info:v8 ports:objc_opt_new()];
  return v5;
}

+ (uint64_t)mainRunLoop
{
  uint64_t v0 = _CFRunLoopGet2();
  _CFAutoreleasePoolPop();
  return v0;
}

- (uint64_t)init
{
  return 0LL;
}

- (id)dealloc
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  -[NSNotificationCenter removeObserver:name:object:]( +[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"),  "removeObserver:name:object:",  a1,  @"NSPortDidBecomeInvalidNotification",  0LL);
  [a1 _deallocHelper];
  v3.receiver = a1;
  v3.super_class = (Class)&off_18C686B30;
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

- (CFStringRef)description
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  v2 = (const void *)[a1 getCFRunLoop];
  if (v2) {
    return (id)CFCopyDescription(v2);
  }
  v4.receiver = a1;
  v4.super_class = (Class)&off_18C686B30;
  return (CFStringRef)objc_msgSendSuper2(&v4, sel_description);
}

- (uint64_t)addPort:()NSRunLoop forMode:
{
  objc_super v4 = a4;
  if (a3 && a4 || !_CFExecutableLinkedOnOrAfter())
  {
    uint64_t result = -[objc_class getCFRunLoop](a1, "getCFRunLoop");
    if (result)
    {
      if (v4 == (void *)*MEMORY[0x189603B48]
        || [v4 isEqual:@"kCFRunLoopCommonModes"])
      {
        objc_super v4 = (void *)*MEMORY[0x1896051A8];
      }

      return -[objc_class _addPort:forMode:](a1, "_addPort:forMode:", a3, v4);
    }
  }

  else
  {
    uint64_t v9 = _NSMethodExceptionProem(a1, a2);
    uint64_t v10 = "port";
    if (a3) {
      uint64_t v10 = "mode";
    }
    char v11 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: %s argument cannot be nil",  v9,  v10);
    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:v11 userInfo:0]);
    return -[NSRunLoop(NSRunLoop) removePort:forMode:]();
  }

  return result;
}

- (uint64_t)removePort:()NSRunLoop forMode:
{
  objc_super v4 = a4;
  if (!a4 && _CFExecutableLinkedOnOrAfter())
  {
    uint64_t v9 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: mode argument cannot be nil", _NSMethodExceptionProem(a1, a2)), 0 reason userInfo];
    objc_exception_throw(v9);
    return -[NSRunLoop(NSRunLoop) containsPort:forMode:]();
  }

  else
  {
    uint64_t result = -[objc_class getCFRunLoop](a1, "getCFRunLoop");
    if (a3 && result)
    {
      if (v4 == (void *)*MEMORY[0x189603B48]
        || [v4 isEqual:@"kCFRunLoopCommonModes"])
      {
        objc_super v4 = (void *)*MEMORY[0x1896051A8];
      }

      return -[objc_class _removePort:forMode:](a1, "_removePort:forMode:", a3, v4);
    }
  }

  return result;
}

- (uint64_t)containsPort:()NSRunLoop forMode:
{
  objc_super v4 = a4;
  if (!a4 && _CFExecutableLinkedOnOrAfter())
  {
    uint64_t v10 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: mode argument cannot be nil", _NSMethodExceptionProem(a1, a2)), 0 reason userInfo];
    objc_exception_throw(v10);
    return -[NSRunLoop(NSRunLoop) portsForMode:]();
  }

  else
  {
    uint64_t v8 = -[objc_class getCFRunLoop](a1, "getCFRunLoop");
    if (a3 && v8)
    {
      if (v4 == (void *)*MEMORY[0x189603B48]
        || [v4 isEqual:@"kCFRunLoopCommonModes"])
      {
        objc_super v4 = (void *)*MEMORY[0x1896051A8];
      }

      return -[objc_class _containsPort:forMode:](a1, "_containsPort:forMode:", a3, v4);
    }

    else
    {
      return 0LL;
    }
  }

- (uint64_t)portsForMode:()NSRunLoop
{
  return [MEMORY[0x189603F18] array];
}

- (void)addTimer:()NSRunLoop forMode:
{
  objc_super v4 = a4;
  if (!a4 && _CFExecutableLinkedOnOrAfter())
  {
    uint64_t v10 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: mode argument cannot be nil", _NSMethodExceptionProem(a1, a2)), 0 reason userInfo];
    objc_exception_throw(v10);
    -[NSRunLoop(NSRunLoop) removeTimer:forMode:]();
  }

  else
  {
    uint64_t v8 = -[objc_class getCFRunLoop](a1, "getCFRunLoop");
    if (v8)
    {
      uint64_t v9 = (__CFRunLoop *)v8;
      if (v4 == (__CFString *)*MEMORY[0x189603B48]
        || -[__CFString isEqual:](v4, "isEqual:", @"kCFRunLoopCommonModes"))
      {
        objc_super v4 = (__CFString *)*MEMORY[0x1896051A8];
      }

      CFRunLoopAddTimer(v9, a3, v4);
    }
  }

- (void)removeTimer:()NSRunLoop forMode:
{
  objc_super v4 = a4;
  if (!a4 && _CFExecutableLinkedOnOrAfter())
  {
    uint64_t v10 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: mode argument cannot be nil", _NSMethodExceptionProem(a1, a2)), 0 reason userInfo];
    objc_exception_throw(v10);
    -[NSRunLoop(NSRunLoop) timersForMode:]();
  }

  else
  {
    uint64_t v8 = -[objc_class getCFRunLoop](a1, "getCFRunLoop");
    if (v8)
    {
      uint64_t v9 = (__CFRunLoop *)v8;
      if (v4 == (__CFString *)*MEMORY[0x189603B48]
        || -[__CFString isEqual:](v4, "isEqual:", @"kCFRunLoopCommonModes"))
      {
        objc_super v4 = (__CFString *)*MEMORY[0x1896051A8];
      }

      CFRunLoopRemoveTimer(v9, a3, v4);
    }
  }

- (uint64_t)timersForMode:()NSRunLoop
{
  return [MEMORY[0x189603F18] array];
}

- (uint64_t)containsTimer:()NSRunLoop forMode:
{
  objc_super v4 = a4;
  if (!a4 && _CFExecutableLinkedOnOrAfter())
  {
    uint64_t v10 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: mode argument cannot be nil", _NSMethodExceptionProem(a1, a2)), 0 reason userInfo];
    objc_exception_throw(v10);
    return -[NSRunLoop(NSRunLoop) allModes]();
  }

  else
  {
    uint64_t result = -[objc_class getCFRunLoop](a1, "getCFRunLoop");
    if (result)
    {
      uint64_t v9 = (__CFRunLoop *)result;
      if (v4 == (__CFString *)*MEMORY[0x189603B48]
        || -[__CFString isEqual:](v4, "isEqual:", @"kCFRunLoopCommonModes"))
      {
        objc_super v4 = (__CFString *)*MEMORY[0x1896051A8];
      }

      return CFRunLoopContainsTimer(v9, a3, v4) != 0;
    }
  }

  return result;
}

- (CFArrayRef)allModes
{
  v1 = (__CFRunLoop *)[a1 getCFRunLoop];
  if (v1) {
    return CFRunLoopCopyAllModes(v1);
  }
  else {
    return (CFArrayRef)[MEMORY[0x189603F18] array];
  }
}

- (__CFRunLoop)currentMode
{
  uint64_t result = (__CFRunLoop *)[a1 getCFRunLoop];
  if (result) {
    return (__CFRunLoop *)(id)CFRunLoopCopyCurrentMode(result);
  }
  return result;
}

- (uint64_t)limitDateForMode:()NSRunLoop
{
  objc_super v3 = a3;
  if (!a3 && _CFExecutableLinkedOnOrAfter())
  {
    uint64_t v9 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: mode argument cannot be nil", _NSMethodExceptionProem(a1, a2)), 0 reason userInfo];
    objc_exception_throw(v9);
    return -[NSRunLoop(NSRunLoop) _wakeup]();
  }

  else
  {
    uint64_t v6 = -[objc_class getCFRunLoop](a1, "getCFRunLoop");
    if (!v6) {
      return 0LL;
    }
    uint64_t v7 = (__CFRunLoop *)v6;
    CFRunLoopRunInMode(v3, -10.0, 1u);
    if (!_CFRunLoopFinished())
    {
      if (CFRunLoopGetNextTimerFireDate(v7, v3) == 0.0) {
        return [MEMORY[0x189603F50] distantFuture];
      }
      else {
        return objc_msgSend(MEMORY[0x189603F50], "dateWithTimeIntervalSinceReferenceDate:");
      }
    }

    else
    {
      return 0LL;
    }
  }

- (void)_wakeup
{
  v1 = (__CFRunLoop *)[a1 getCFRunLoop];
  if (v1)
  {
    v2 = v1;
    CFRunLoopStop(v1);
    CFRunLoopWakeUp(v2);
  }

- (uint64_t)acceptInputForMode:()NSRunLoop beforeDate:
{
  uint64_t v5 = a3;
  if (!a3 && _CFExecutableLinkedOnOrAfter())
  {
    uint64_t v12 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: mode argument cannot be nil", _NSMethodExceptionProem(a1, a2)), 0 reason userInfo];
    objc_exception_throw(v12);
    return -[NSRunLoop(NSRunLoop) runMode:untilDate:]();
  }

  else
  {
    uint64_t result = -[objc_class getCFRunLoop](a1, "getCFRunLoop");
    if (result)
    {
      uint64_t result = _CFRunLoopIsCurrent();
      if ((_DWORD)result)
      {
        [a4 timeIntervalSinceReferenceDate];
        double v10 = v9;
        [MEMORY[0x189603F50] timeIntervalSinceReferenceDate];
        return CFRunLoopRunInMode(v5, v10 - v11, 1u);
      }
    }
  }

  return result;
}

- (uint64_t)runMode:()NSRunLoop untilDate:
{
  if (!a3 && _CFExecutableLinkedOnOrAfter())
  {
    uint64_t v16 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: mode argument cannot be nil", _NSMethodExceptionProem(a1, a2)), 0 reason userInfo];
    objc_exception_throw(v16);
    return -[NSRunLoop(NSRunLoop) run]();
  }

  else
  {
    if (!-[objc_class getCFRunLoop](a1, "getCFRunLoop")) {
      return 0LL;
    }
    id v8 = a4;
    if (-[objc_class runMode:beforeDate:](a1, "runMode:beforeDate:", a3, a4))
    {
      [a4 timeIntervalSinceReferenceDate];
      double v10 = v9;
      double Current = CFAbsoluteTimeGetCurrent();
      if (v10 <= Current)
      {
        unsigned int v12 = 1;
      }

      else
      {
        do
        {
          unsigned int v12 = -[objc_class runMode:beforeDate:](a1, "runMode:beforeDate:", a3, a4);
          if (!v12) {
            break;
          }
          [a4 timeIntervalSinceReferenceDate];
        }

        while (v13 > CFAbsoluteTimeGetCurrent());
      }

      if (v10 > Current) {
        uint64_t v14 = 1LL;
      }
      else {
        uint64_t v14 = v12;
      }
    }

    else
    {
      uint64_t v14 = 0LL;
    }

    return v14;
  }

- (uint64_t)run
{
  uint64_t v2 = *MEMORY[0x1896051B0];
  do
    uint64_t result = objc_msgSend(a1, "runMode:beforeDate:", v2, objc_msgSend(MEMORY[0x189603F50], "distantFuture"));
  while ((result & 1) != 0);
  return result;
}

- (void)runUntilDate:()NSRunLoop
{
  id v4 = a3;
  uint64_t v5 = *MEMORY[0x1896051B0];
  do
  {
    [a3 timeIntervalSinceReferenceDate];
  }

  while (v6 > CFAbsoluteTimeGetCurrent());
}

- (uint64_t)runBeforeDate:()NSRunLoop
{
  return [a1 runMode:*MEMORY[0x1896051B0] beforeDate:a3];
}

- (void)performInModes:()NSRunLoop block:
{
  if (a4)
  {
    if (a3 && [a3 count])
    {
      id v8 = (__CFRunLoop *)-[objc_class getCFRunLoop](a1, "getCFRunLoop");
      CFRunLoopPerformBlock(v8, a3, a4);
      CFRunLoopWakeUp(v8);
      return;
    }

    double v9 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: modes for block performers on run loops cannot be nil or contain no elements",  _NSMethodExceptionProem(a1, a2));
  }

  else
  {
    double v9 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@: block targets for run loops cannot be nil",  _NSMethodExceptionProem(a1, a2));
  }

  objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60] reason:v9 userInfo:0]);
  -[NSRunLoop(NSRunLoop) performBlock:]();
}

- (uint64_t)performBlock:()NSRunLoop
{
  v4[1] = *MEMORY[0x1895F89C0];
  v4[0] = *MEMORY[0x189603A40];
  return objc_msgSend( a1,  "performInModes:block:",  objc_msgSend(MEMORY[0x189603F18], "arrayWithObjects:count:", v4, 1),  a3);
}

@end