@interface _PFTask
+ (uint64_t)getNumActiveProcessors;
+ (uint64_t)getPhysicalMemory;
- (BOOL)_isDeallocating;
- (BOOL)_tryRetain;
- (_PFTask)initWithFunction:(void *)a3 withArgument:(void *)a4 andPriority:(int)a5;
- (_PFTask)retain;
- (unint64_t)retainCount;
- (void)dealloc;
- (void)release;
@end

@implementation _PFTask

+ (uint64_t)getNumActiveProcessors
{
  size_t v1 = 4LL;
  sysctlbyname("hw.activecpu", &v2, &v1, 0LL, 0LL);
  return v2;
}

+ (uint64_t)getPhysicalMemory
{
  size_t v1 = 8LL;
  uint64_t v2 = 0LL;
  if (sysctlbyname("hw.memsize", &v2, &v1, 0LL, 0LL)) {
    return 0LL;
  }
  else {
    return v2;
  }
}

- (_PFTask)initWithFunction:(void *)a3 withArgument:(void *)a4 andPriority:(int)a5
{
  v8 = self;
  pthread_mutex_init(&self->lock, 0LL);
  pthread_cond_init(&v8->condition, 0LL);
  v8->isFinishedFlag = 0;
  v8->_task = a3;
  v8->arguments = a4;
  CFRetain(v8);
  __dmb(0xBu);
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(a5, 2uLL);
  if (global_queue)
  {
    dispatch_async_f(global_queue, v8, (dispatch_function_t)minion_duties2);
  }

  else
  {
    CFRelease(v8);

    return 0LL;
  }

  return v8;
}

- (void)dealloc
{
  arguments = self->arguments;
  if (arguments)
  {
    v4 = (malloc_zone_t *)_PF_Private_Malloc_Zone;
    if (!_PF_Private_Malloc_Zone)
    {
      v4 = malloc_default_zone();
      arguments = self->arguments;
    }

    malloc_zone_free(v4, arguments);
    self->arguments = 0LL;
  }

  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS____PFTask;
  -[_PFTask dealloc](&v5, sel_dealloc);
}

- (_PFTask)retain
{
  p_cd_rc = &self->_cd_rc;
  do
    unsigned int v3 = __ldxr((unsigned int *)p_cd_rc);
  while (__stxr(v3 + 1, (unsigned int *)p_cd_rc));
  return self;
}

- (void)release
{
  p_cd_rc = &self->_cd_rc;
  do
    int v3 = __ldxr((unsigned int *)p_cd_rc);
  while (__stxr(v3 - 1, (unsigned int *)p_cd_rc));
  if (v3 <= 0)
  {
    do
      unsigned int v4 = __ldxr((unsigned int *)p_cd_rc);
    while (__stxr(v4 + 0x20000000, (unsigned int *)p_cd_rc));
    -[_PFTask dealloc](self, "dealloc");
  }

- (unint64_t)retainCount
{
  return self->_cd_rc + 1LL;
}

- (BOOL)_tryRetain
{
  return 0;
}

- (BOOL)_isDeallocating
{
  return 1;
}

@end