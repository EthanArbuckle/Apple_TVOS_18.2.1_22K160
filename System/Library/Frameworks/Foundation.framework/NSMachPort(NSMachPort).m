@interface NSMachPort(NSMachPort)
+ (id)port;
+ (id)portWithMachPort:()NSMachPort;
+ (id)portWithMachPort:()NSMachPort options:;
+ (uint64_t)sendBeforeTime:()NSMachPort streamData:components:to:from:msgid:reserved:;
- (BOOL)isEqual:()NSMachPort;
- (BOOL)isValid;
- (CFHashCode)hash;
- (CFIndex)retainCount;
- (uint64_t)_isDeallocating;
- (uint64_t)_tryRetain;
- (uint64_t)delegate;
- (uint64_t)init;
- (uint64_t)initWithMachPort:()NSMachPort;
- (uint64_t)isKindOfClass:()NSMachPort;
- (uint64_t)isMemberOfClass:()NSMachPort;
- (uint64_t)machPort;
- (uint64_t)sendBeforeDate:()NSMachPort components:from:reserved:;
- (uint64_t)sendBeforeDate:()NSMachPort msgid:components:from:reserved:;
- (uint64_t)sendBeforeTime:()NSMachPort streamData:components:from:msgid:;
- (unint64_t)retain;
- (void)initWithMachPort:()NSMachPort options:;
- (void)invalidate;
- (void)release;
- (void)removeFromRunLoop:()NSMachPort forMode:;
- (void)scheduleInRunLoop:()NSMachPort forMode:;
- (void)setDelegate:()NSMachPort;
@end

@implementation NSMachPort(NSMachPort)

+ (id)port
{
  return (id)[objc_allocWithZone(a1) init];
}

+ (id)portWithMachPort:()NSMachPort
{
  return (id)[objc_allocWithZone(a1) initWithMachPort:a3];
}

+ (id)portWithMachPort:()NSMachPort options:
{
  return (id)[objc_allocWithZone(a1) initWithMachPort:a3 options:a4];
}

- (BOOL)isEqual:()NSMachPort
{
  if (!a3) {
    return 0LL;
  }
  uint64_t v5 = objc_opt_class();
  if (v5 == objc_opt_class() && (unint64_t v7 = atomic_load(a1 + 1)) != 0) {
    return CFEqual(a1, a3) != 0;
  }
  else {
    return a1 == a3;
  }
}

- (CFHashCode)hash
{
  uint64_t v2 = objc_opt_class();
  if (v2 == objc_opt_class() && (unint64_t v4 = atomic_load(a1 + 1)) != 0) {
    return CFHash(a1);
  }
  else {
    return [a1 _machPort];
  }
}

- (unint64_t)retain
{
  uint64_t v2 = objc_opt_class();
  if (v2 == objc_opt_class())
  {
    if (atomic_load(a1 + 1)) {
      return (unint64_t *)CFRetain(a1);
    }
  }

  [a1 _increaseRetainCountWithLock:&_NSGlobalRetainLock];
  if (*MEMORY[0x1896049A0]) {
    __CFRecordAllocationEvent();
  }
  return a1;
}

- (void)release
{
  v4[5] = *MEMORY[0x1895F89C0];
  uint64_t v2 = objc_opt_class();
  if (v2 == objc_opt_class() && (unint64_t v3 = atomic_load(a1 + 1)) != 0)
  {
    CFRelease(a1);
  }

  else
  {
    if (*MEMORY[0x1896049A0]) {
      __CFRecordAllocationEvent();
    }
    v4[0] = MEMORY[0x1895F87A8];
    v4[1] = 3221225472LL;
    v4[2] = __33__NSMachPort_NSMachPort__release__block_invoke;
    v4[3] = &unk_189C9A030;
    v4[4] = a1;
    [a1 _decreaseRetainCountAndMaybeDeallocWithLock:&_NSGlobalRetainLock andPerformWhenZero:v4];
  }

- (uint64_t)_isDeallocating
{
  return 1LL;
}

- (uint64_t)_tryRetain
{
  return 0LL;
}

- (CFIndex)retainCount
{
  uint64_t v2 = objc_opt_class();
  if (v2 == objc_opt_class() && (unint64_t v4 = atomic_load(a1 + 1)) != 0) {
    return CFGetRetainCount(a1);
  }
  else {
    return [a1 _retainCount] + 1;
  }
}

- (uint64_t)isKindOfClass:()NSMachPort
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  uint64_t v5 = objc_opt_class();
  if (v5 == objc_opt_class())
  {
    if (atomic_load(a1 + 1))
    {
      if (objc_opt_class() == a3) {
        return 1LL;
      }
    }
  }

  v8.receiver = a1;
  v8.super_class = (Class)&off_18C6899C0;
  return (uint64_t)objc_msgSendSuper2(&v8, sel_isKindOfClass_, a3);
}

- (uint64_t)isMemberOfClass:()NSMachPort
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  uint64_t v5 = objc_opt_class();
  if (v5 == objc_opt_class())
  {
    if (atomic_load(a1 + 1))
    {
      if (objc_opt_class() == a3) {
        return 1LL;
      }
    }
  }

  v8.receiver = a1;
  v8.super_class = (Class)&off_18C6899C0;
  return (uint64_t)objc_msgSendSuper2(&v8, sel_isMemberOfClass_, a3);
}

- (BOOL)isValid
{
  uint64_t v2 = objc_opt_class();
  if (v2 == objc_opt_class() && (unint64_t v4 = atomic_load(a1 + 1)) != 0) {
    int IsValid = CFMachPortIsValid((CFMachPortRef)a1);
  }
  else {
    int IsValid = [a1 _machPort];
  }
  return IsValid != 0;
}

- (void)invalidate
{
  uint64_t v2 = objc_opt_class();
  if (v2 == objc_opt_class() && (unint64_t v7 = atomic_load(a1 + 1)) != 0)
  {
    if (CFMachPortIsValid((CFMachPortRef)a1)) {
      CFMachPortInvalidate((CFMachPortRef)a1);
    }
  }

  else
  {
    [a1 setDelegate:0];
    mach_port_name_t v3 = [a1 _machPort];
    if (v3)
    {
      mach_port_name_t v4 = v3;
      char v5 = [a1 _flags];
      v6 = (ipc_space_t *)MEMORY[0x1895FBBE0];
      if ((v5 & 2) != 0) {
        mach_port_mod_refs(*MEMORY[0x1895FBBE0], v4, 1u, -1);
      }
      if ((v5 & 1) != 0) {
        mach_port_deallocate(*v6, v4);
      }
      [a1 _setMachPort:0];
      -[NSNotificationCenter postNotificationName:object:userInfo:]( +[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"),  "postNotificationName:object:userInfo:",  @"NSPortDidBecomeInvalidNotification",  a1,  0LL);
    }
  }

- (uint64_t)machPort
{
  uint64_t v2 = objc_opt_class();
  if (v2 == objc_opt_class() && (unint64_t v4 = atomic_load(a1 + 1)) != 0) {
    return CFMachPortGetPort((CFMachPortRef)a1);
  }
  else {
    return [a1 _machPort];
  }
}

- (void)setDelegate:()NSMachPort
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  uint64_t v5 = objc_opt_class();
  if (v5 == objc_opt_class() && (unint64_t v6 = atomic_load(a1 + 1)) != 0)
  {
    if (CFMachPortIsValid((CFMachPortRef)a1))
    {
      v7.version = 0LL;
      CFMachPortGetContext((CFMachPortRef)a1, &v7);
      if (v7.info)
      {
        if (*((void *)v7.info + 4) == ~*((void *)v7.info + 3)) {
          *((void *)v7.info + 1) = a3;
        }
      }
    }
  }

  else
  {
    [a1 _setDelegate:a3];
  }

- (uint64_t)delegate
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  uint64_t v2 = objc_opt_class();
  if (v2 != objc_opt_class()) {
    return [a1 _delegate];
  }
  if (!atomic_load(a1 + 1)) {
    return [a1 _delegate];
  }
  v5.version = 0LL;
  CFMachPortGetContext((CFMachPortRef)a1, &v5);
  uint64_t result = 0LL;
  if (*((void *)v5.info + 4) == ~*((void *)v5.info + 3)) {
    return *((void *)v5.info + 1);
  }
  return result;
}

+ (uint64_t)sendBeforeTime:()NSMachPort streamData:components:to:from:msgid:reserved:
{
  mach_msg_return_t v40;
  uint64_t result;
  void *v42;
  CFStringRef v43;
  NSString *v44;
  _BYTE v49[128];
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  uint64_t v54;
  uint64_t v9 = a7;
  v11 = a4;
  v54 = *MEMORY[0x1895F89C0];
  if (!a5)
  {
    uint64_t v13 = a4 != 0LL;
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      size_t v17 = 40LL;
      goto LABEL_22;
    }

    if ((objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      size_t v17 = 44LL;
      goto LABEL_22;
    }

- (uint64_t)sendBeforeTime:()NSMachPort streamData:components:from:msgid:
{
  return objc_msgSend( (id)objc_opt_class(),  "sendBeforeTime:streamData:components:to:from:msgid:reserved:",  a4,  a5,  a1,  a6,  a7,  objc_msgSend(a1, "reservedSpaceLength"),  a2);
}

- (uint64_t)sendBeforeDate:()NSMachPort components:from:reserved:
{
  v11 = (void *)objc_opt_class();
  [a3 timeIntervalSinceReferenceDate];
  return objc_msgSend(v11, "sendBeforeTime:streamData:components:to:from:msgid:reserved:", 0, a4, a1, a5, 0, a6);
}

- (uint64_t)sendBeforeDate:()NSMachPort msgid:components:from:reserved:
{
  uint64_t v13 = (void *)objc_opt_class();
  [a3 timeIntervalSinceReferenceDate];
  return objc_msgSend(v13, "sendBeforeTime:streamData:components:to:from:msgid:reserved:", 0, a5, a1, a6, a4, a7);
}

- (void)scheduleInRunLoop:()NSMachPort forMode:
{
  if (a3)
  {
    uint64_t v8 = objc_opt_class();
    if (v8 != objc_opt_class() || (unint64_t v9 = atomic_load(a1 + 1)) == 0)
    {
      v12 = NSClassFromString((NSString *)@"NSMachPort");
      NSRequestConcreteImplementation((uint64_t)a1, a2, v12);
    }

    RunLoopSource = CFMachPortCreateRunLoopSource(0LL, (CFMachPortRef)a1, 200LL);
    if (RunLoopSource)
    {
      v11 = RunLoopSource;
      CFRunLoopAddSource((CFRunLoopRef)[a3 getCFRunLoop], RunLoopSource, a4);
      CFRelease(v11);
    }
  }

- (void)removeFromRunLoop:()NSMachPort forMode:
{
  if (a3)
  {
    uint64_t v8 = objc_opt_class();
    if (v8 != objc_opt_class() || (unint64_t v9 = atomic_load(a1 + 1)) == 0)
    {
      v12 = NSClassFromString((NSString *)@"NSMachPort");
      NSRequestConcreteImplementation((uint64_t)a1, a2, v12);
    }

    RunLoopSource = CFMachPortCreateRunLoopSource(0LL, (CFMachPortRef)a1, 200LL);
    if (RunLoopSource)
    {
      v11 = RunLoopSource;
      CFRunLoopRemoveSource((CFRunLoopRef)[a3 getCFRunLoop], RunLoopSource, a4);
      CFRelease(v11);
    }
  }

- (void)initWithMachPort:()NSMachPort options:
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  if (!(_DWORD)a3)
  {
    v16.receiver = a1;
    v16.super_class = (Class)&off_18C6899C0;
    objc_msgSendSuper2(&v16, sel_dealloc);
    return 0LL;
  }

  uint64_t v7 = objc_opt_class();
  if (v7 != objc_opt_class())
  {
    v12.receiver = a1;
    v12.super_class = (Class)&off_18C6899C0;
    uint64_t v8 = objc_msgSendSuper2(&v12, sel_init);
    [v8 _setFlags:a4 & 3];
    [v8 _setMachPort:a3];
    return v8;
  }

  unint64_t v10 = (unint64_t)calloc(1uLL, 0x30uLL);
  if (!v10) {
    return 0LL;
  }
  v11 = (void *)v10;
  *(void *)(v10 + 8) = 0LL;
  *(void *)(v10 + 16) = a4 & 3;
  *(void *)(v10 + 24) = ~v10;
  *(void *)(v10 + 32) = v10;
  *(_DWORD *)(v10 + 40) = a3;
  Boolean shouldFreeInfo = 0;
  context.version = 0LL;
  context.info = (void *)v10;
  context.retain = 0LL;
  context.release = (void (__cdecl *)(const void *))__destroyPortContext;
  context.copyDescription = 0LL;
  uint64_t v8 = CFMachPortCreateWithPort(0LL, a3, (CFMachPortCallBack)__NSFireMachPort, &context, &shouldFreeInfo);
  if (v8 && (_cfmp_record_nsmachport_is_interested(), !shouldFreeInfo))
  {
    mach_port_type_t ptype = 0;
    if (!mach_port_type(*MEMORY[0x1895FBBE0], a3, &ptype) && (ptype & 0x50000) != 0) {
      CFMachPortSetInvalidationCallBack((CFMachPortRef)v8, (CFMachPortInvalidationCallBack)_NSPortDeathNotify);
    }
  }

  else
  {
    free(v11);
  }

  return v8;
}

- (uint64_t)initWithMachPort:()NSMachPort
{
  return [a1 initWithMachPort:a3 options:3];
}

- (uint64_t)init
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  uint64_t v2 = (ipc_space_t *)MEMORY[0x1895FBBE0];
  if (mach_port_allocate(*MEMORY[0x1895FBBE0], 1u, &name)) {
    goto LABEL_4;
  }
  if (mach_port_insert_right(*v2, name, name, 0x14u))
  {
    mach_port_mod_refs(*v2, name, 1u, -1);
LABEL_4:
    v4.receiver = a1;
    v4.super_class = (Class)&off_18C6899C0;
    objc_msgSendSuper2(&v4, sel_dealloc);
    return 0LL;
  }

  uint64_t result = [a1 initWithMachPort:name options:3];
  if (!result)
  {
    mach_port_mod_refs(*v2, name, 1u, -1);
    mach_port_deallocate(*v2, name);
    return 0LL;
  }

  return result;
}

@end