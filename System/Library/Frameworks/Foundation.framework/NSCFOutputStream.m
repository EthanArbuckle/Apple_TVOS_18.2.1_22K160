@interface NSCFOutputStream
+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3;
+ (id)allocWithZone:(_NSZone *)a3;
- (BOOL)_setCFClientFlags:(unint64_t)a3 callback:(void *)a4 context:(id *)a5;
- (BOOL)allowsWeakReference;
- (BOOL)hasSpaceAvailable;
- (BOOL)isEqual:(id)a3;
- (BOOL)retainWeakReference;
- (BOOL)setProperty:(id)a3 forKey:(id)a4;
- (NSCFOutputStream)initWithURL:(id)a3 append:(BOOL)a4;
- (id)delegate;
- (id)initToBuffer:(char *)a3 capacity:(unint64_t)a4;
- (id)initToFileAtPath:(id)a3 append:(BOOL)a4;
- (id)initToMemory;
- (id)propertyForKey:(id)a3;
- (id)streamError;
- (int64_t)write:(const char *)a3 maxLength:(unint64_t)a4;
- (void)_scheduleInCFRunLoop:(__CFRunLoop *)a3 forMode:(__CFString *)a4;
- (void)_unscheduleFromCFRunLoop:(__CFRunLoop *)a3 forMode:(__CFString *)a4;
- (void)removeFromRunLoop:(id)a3 forMode:(id)a4;
- (void)scheduleInRunLoop:(id)a3 forMode:(id)a4;
- (void)setDelegate:(id)a3;
@end

@implementation NSCFOutputStream

- (BOOL)isEqual:(id)a3
{
  if (!a3) {
    return 0;
  }
  if (self == a3) {
    return 1;
  }
  return _CFNonObjCEqual() != 0;
}

- (BOOL)allowsWeakReference
{
  return _CFIsDeallocating() == 0;
}

- (BOOL)retainWeakReference
{
  return _CFTryRetain() != 0;
}

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  return 0;
}

+ (id)allocWithZone:(_NSZone *)a3
{
  return NSAllocateObject((Class)a1, 0LL, a3);
}

- (id)initToMemory
{
  return CFWriteStreamCreateWithAllocatedBuffers(0LL, (CFAllocatorRef)*MEMORY[0x189604DB0]);
}

- (id)initToBuffer:(char *)a3 capacity:(unint64_t)a4
{
  return CFWriteStreamCreateWithBuffer(0LL, (UInt8 *)a3, a4);
}

- (id)initToFileAtPath:(id)a3 append:(BOOL)a4
{
  BOOL v4 = a4;
  id result = (id)[objc_alloc(MEMORY[0x189604030]) initFileURLWithPath:a3];
  if (result)
  {
    id v7 = result;
    v8 = -[NSCFOutputStream initWithURL:append:](self, "initWithURL:append:", result, v4);

    return v8;
  }

  return result;
}

- (NSCFOutputStream)initWithURL:(id)a3 append:(BOOL)a4
{
  BOOL v4 = a4;
  NSDeallocateObject(self);
  if (a3)
  {
    CFWriteStreamRef v6 = CFWriteStreamCreateWithFile(0LL, (CFURLRef)a3);
    a3 = v6;
    if (v4) {
      CFWriteStreamSetProperty(v6, (CFStreamPropertyKey)*MEMORY[0x1896051C8], (CFTypeRef)*MEMORY[0x189604DE8]);
    }
  }

  return (NSCFOutputStream *)a3;
}

- (id)delegate
{
  return (id)[(id)_CFWriteStreamGetClient() retainedDelegate];
}

- (void)setDelegate:(id)a3
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  if (a3)
  {
    BOOL v4 = -[NSCFStreamWeakDelegateWrapper initWithDelegate:]( objc_alloc(&OBJC_CLASS___NSCFStreamWeakDelegateWrapper),  "initWithDelegate:",  a3);
    v5.version = 0LL;
    v5.info = v4;
    v5.retain = (void *(__cdecl *)(void *))MEMORY[0x1896030F0];
    v5.release = (void (__cdecl *)(void *))MEMORY[0x1896030E0];
    v5.copyDescription = 0LL;
    CFWriteStreamSetClient((CFWriteStreamRef)self, 0x1DuLL, (CFWriteStreamClientCallBack)_outputStreamCallbackFunc, &v5);
  }

  else
  {
    CFWriteStreamSetClient((CFWriteStreamRef)self, 0LL, 0LL, 0LL);
  }

- (id)propertyForKey:(id)a3
{
  return (id)(id)CFWriteStreamCopyProperty((CFWriteStreamRef)self, (CFStreamPropertyKey)a3);
}

- (BOOL)setProperty:(id)a3 forKey:(id)a4
{
  return CFWriteStreamSetProperty((CFWriteStreamRef)self, (CFStreamPropertyKey)a4, a3) != 0;
}

- (void)scheduleInRunLoop:(id)a3 forMode:(id)a4
{
  if (a3) {
    CFWriteStreamScheduleWithRunLoop( (CFWriteStreamRef)self,  (CFRunLoopRef)[a3 getCFRunLoop],  (CFRunLoopMode)a4);
  }
}

- (void)removeFromRunLoop:(id)a3 forMode:(id)a4
{
  if (a3) {
    CFWriteStreamUnscheduleFromRunLoop( (CFWriteStreamRef)self,  (CFRunLoopRef)[a3 getCFRunLoop],  (CFRunLoopMode)a4);
  }
}

- (id)streamError
{
  return CFWriteStreamCopyError((CFWriteStreamRef)self);
}

- (int64_t)write:(const char *)a3 maxLength:(unint64_t)a4
{
  return CFWriteStreamWrite((CFWriteStreamRef)self, (const UInt8 *)a3, a4);
}

- (BOOL)hasSpaceAvailable
{
  return CFWriteStreamCanAcceptBytes((CFWriteStreamRef)self) != 0;
}

- (BOOL)_setCFClientFlags:(unint64_t)a3 callback:(void *)a4 context:(id *)a5
{
  return CFWriteStreamSetClient( (CFWriteStreamRef)self,  a3,  (CFWriteStreamClientCallBack)a4,  (CFStreamClientContext *)a5) != 0;
}

- (void)_scheduleInCFRunLoop:(__CFRunLoop *)a3 forMode:(__CFString *)a4
{
}

- (void)_unscheduleFromCFRunLoop:(__CFRunLoop *)a3 forMode:(__CFString *)a4
{
}

@end