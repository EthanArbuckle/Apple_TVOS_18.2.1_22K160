@interface NSMessagePort
+ (BOOL)sendBeforeTime:(double)a3 streamData:(id)a4 components:(id)a5 to:(id)a6 from:(id)a7 msgid:(unsigned int)a8 reserved:(unint64_t)a9;
- (BOOL)_isDeallocating;
- (BOOL)_tryRetain;
- (BOOL)isValid;
- (BOOL)sendBeforeDate:(id)a3 components:(id)a4 from:(id)a5 reserved:(unint64_t)a6;
- (BOOL)sendBeforeDate:(id)a3 msgid:(unint64_t)a4 components:(id)a5 from:(id)a6 reserved:(unint64_t)a7;
- (BOOL)sendBeforeTime:(double)a3 streamData:(void *)a4 components:(id)a5 from:(id)a6 msgid:(unsigned int)a7;
- (BOOL)setName:(id)a3;
- (NSMessagePort)init;
- (NSMessagePort)initWithName:(id)a3;
- (NSMessagePort)initWithRemoteName:(id)a3;
- (NSMessagePort)retain;
- (id)delegate;
- (id)name;
- (unint64_t)retainCount;
- (void)dealloc;
- (void)invalidate;
- (void)release;
- (void)removeFromRunLoop:(id)a3 forMode:(id)a4;
- (void)scheduleInRunLoop:(id)a3 forMode:(id)a4;
- (void)setDelegate:(id)a3;
@end

@implementation NSMessagePort

- (BOOL)isValid
{
  return CFMessagePortIsValid((CFMessagePortRef)self->_port) != 0;
}

- (void)invalidate
{
  if (CFMessagePortIsValid((CFMessagePortRef)self->_port))
  {
    CFMessagePortInvalidate((CFMessagePortRef)self->_port);
    -[NSNotificationCenter postNotificationName:object:userInfo:]( +[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"),  "postNotificationName:object:userInfo:",  @"NSPortDidBecomeInvalidNotification",  self,  0LL);
  }

- (void)setDelegate:(id)a3
{
  self->_delegate = a3;
}

- (id)delegate
{
  return self->_delegate;
}

- (id)name
{
  return (id)CFMessagePortGetName((CFMessagePortRef)self->_port);
}

- (BOOL)setName:(id)a3
{
  return a3 && CFMessagePortSetName((CFMessagePortRef)self->_port, (CFStringRef)a3) != 0;
}

+ (BOOL)sendBeforeTime:(double)a3 streamData:(id)a4 components:(id)a5 to:(id)a6 from:(id)a7 msgid:(unsigned int)a8 reserved:(unint64_t)a9
{
  Mutable = CFDictionaryCreateMutable(0LL, 0LL, MEMORY[0x189605240], MEMORY[0x189605250]);
  if (a7) {
    CFDictionaryAddValue(Mutable, @"NSMessagePortReplyName", (const void *)[a7 name]);
  }
  v37 = (objc_class *)a1;
  if (a4 && !a5)
  {
    a5 = (id)[MEMORY[0x189603FA8] array];
    [a5 addObject:a4];
  }

  v18 = (void *)[MEMORY[0x189603FA8] array];
  uint64_t v19 = [a5 count];
  if (v19)
  {
    uint64_t v20 = v19;
    for (uint64_t i = 0LL; v20 != i; ++i)
    {
      v22 = (void *)[a5 objectAtIndex:i];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          CFRelease(Mutable);
          v28 = _NSMethodExceptionProem(v37, a2);
          NSLog((NSString *)@"%@: found port in components which is not an NSMessagePort", v28);
          return 0;
        }

        v22 = (void *)[v22 name];
      }

      [v18 addObject:v22];
    }
  }

  CFDictionaryAddValue(Mutable, @"NSMessagePortComponents", v18);
  Data = CFPropertyListCreateData(0LL, Mutable, kCFPropertyListXMLFormat_v1_0, 0LL, 0LL);
  v24 = (__CFMessagePort *)*((void *)a6 + 3);
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  uint64_t v26 = CFMessagePortSendRequest(v24, a8, Data, a3 - Current, 0.0, 0LL, 0LL);
  CFRelease(Data);
  CFRelease(Mutable);
  if ((_DWORD)v26 == -1) {
    return 0;
  }
  if (!(_DWORD)v26) {
    return 1;
  }
  v29 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"[NSMessagePort sendBeforeDate:] Cannot send (%d)",  v26);
  objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:@"NSPortSendException" reason:v29 userInfo:0]);
  return -[NSMessagePort sendBeforeTime:streamData:components:from:msgid:](v30, v31, v36, v32, v33, v34, v35);
}

- (BOOL)sendBeforeTime:(double)a3 streamData:(void *)a4 components:(id)a5 from:(id)a6 msgid:(unsigned int)a7
{
  return objc_msgSend( (id)objc_opt_class(),  "sendBeforeTime:streamData:components:to:from:msgid:reserved:",  a4,  a5,  self,  a6,  *(void *)&a7,  -[NSPort reservedSpaceLength](self, "reservedSpaceLength"),  a3);
}

- (BOOL)sendBeforeDate:(id)a3 components:(id)a4 from:(id)a5 reserved:(unint64_t)a6
{
  v11 = (void *)objc_opt_class();
  [a3 timeIntervalSinceReferenceDate];
  return objc_msgSend(v11, "sendBeforeTime:streamData:components:to:from:msgid:reserved:", 0, a4, self, a5, 0, a6);
}

- (BOOL)sendBeforeDate:(id)a3 msgid:(unint64_t)a4 components:(id)a5 from:(id)a6 reserved:(unint64_t)a7
{
  v13 = (void *)objc_opt_class();
  [a3 timeIntervalSinceReferenceDate];
  return objc_msgSend(v13, "sendBeforeTime:streamData:components:to:from:msgid:reserved:", 0, a5, self, a6, a4, a7);
}

- (void)scheduleInRunLoop:(id)a3 forMode:(id)a4
{
  if (a3)
  {
    RunLoopSource = CFMessagePortCreateRunLoopSource(0LL, (CFMessagePortRef)self->_port, 300LL);
    if (RunLoopSource)
    {
      v7 = RunLoopSource;
      CFRunLoopAddSource((CFRunLoopRef)[a3 getCFRunLoop], RunLoopSource, (CFRunLoopMode)a4);
      CFRelease(v7);
    }
  }

- (void)removeFromRunLoop:(id)a3 forMode:(id)a4
{
  if (a3)
  {
    RunLoopSource = CFMessagePortCreateRunLoopSource(0LL, (CFMessagePortRef)self->_port, 300LL);
    if (RunLoopSource)
    {
      v7 = RunLoopSource;
      CFRunLoopRemoveSource((CFRunLoopRef)[a3 getCFRunLoop], RunLoopSource, (CFRunLoopMode)a4);
      CFRelease(v7);
    }
  }

- (NSMessagePort)initWithName:(id)a3
{
  v3 = self;
  uint64_t v9 = *MEMORY[0x1895F89C0];
  context.version = 0LL;
  memset(&context.retain, 0, 24);
  context.info = self;
  CFMessagePortRef v4 = CFMessagePortCreateLocal( 0LL,  (CFStringRef)a3,  (CFMessagePortCallBack)__NSFireMessagePort,  &context,  &shouldFreeInfo);
  v3->_port = v4;
  if (v4)
  {
    if (!shouldFreeInfo) {
      v3->_delegate = 0LL;
    }
  }

  else
  {
    v6.receiver = v3;
    v6.super_class = (Class)&OBJC_CLASS___NSMessagePort;
    -[NSMessagePort dealloc](&v6, sel_dealloc);
    return 0LL;
  }

  return v3;
}

- (NSMessagePort)initWithRemoteName:(id)a3
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  CFMessagePortRef Remote = CFMessagePortCreateRemote(0LL, (CFStringRef)a3);
  self->_port = Remote;
  if (Remote)
  {
    self->_delegate = 0LL;
  }

  else
  {
    v6.receiver = self;
    v6.super_class = (Class)&OBJC_CLASS___NSMessagePort;
    -[NSMessagePort dealloc](&v6, sel_dealloc);
    return 0LL;
  }

  return self;
}

- (NSMessagePort)init
{
  return -[NSMessagePort initWithName:](self, "initWithName:", 0LL);
}

- (BOOL)_isDeallocating
{
  return 1;
}

- (BOOL)_tryRetain
{
  return 0;
}

- (NSMessagePort)retain
{
  return self;
}

- (void)release
{
  if (CFGetRetainCount(self->_port) == 1)
  {
    os_unfair_lock_unlock((os_unfair_lock_t)&_NSGlobalRetainLock);
    -[NSMessagePort invalidate](self, "invalidate");
    os_unfair_lock_lock((os_unfair_lock_t)&_NSGlobalRetainLock);
  }

  if (CFGetRetainCount(self->_port) == 1)
  {
    os_unfair_lock_unlock((os_unfair_lock_t)&_NSGlobalRetainLock);
    -[NSMessagePort dealloc](self, "dealloc");
  }

  else
  {
    CFRelease(self->_port);
    os_unfair_lock_unlock((os_unfair_lock_t)&_NSGlobalRetainLock);
  }

- (unint64_t)retainCount
{
  return CFGetRetainCount(self->_port);
}

- (void)dealloc
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  port = self->_port;
  if (port) {
    CFRelease(port);
  }
  self->_port = 0LL;
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___NSMessagePort;
  -[NSMessagePort dealloc](&v4, sel_dealloc);
}

@end