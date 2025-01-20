@interface NSAutoreleasePool
+ (BOOL)autoreleasePoolExists;
+ (NSAutoreleasePool)allocWithZone:(_NSZone *)a3;
+ (unint64_t)autoreleasedObjectCount;
+ (unint64_t)poolCountHighWaterMark;
+ (unint64_t)poolCountHighWaterResolution;
+ (unint64_t)topAutoreleasePoolCount;
+ (unint64_t)totalAutoreleasedObjects;
+ (void)addObject:(id)anObject;
- (NSAutoreleasePool)autorelease;
- (NSAutoreleasePool)init;
- (NSAutoreleasePool)initWithCapacity:(unint64_t)a3;
- (NSAutoreleasePool)retain;
- (unint64_t)retainCount;
- (void)addObject:(id)anObject;
- (void)dealloc;
- (void)drain;
- (void)release;
@end

@implementation NSAutoreleasePool

+ (NSAutoreleasePool)allocWithZone:(_NSZone *)a3
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  if (_NSDoAPCache)
  {
    for (uint64_t i = 0LL; i != 4; ++i)
    {
      v4 = (unint64_t *)((char *)&_NSAPCache + 8 * i);
      v5 = (NSAutoreleasePool *)*v4;
      if (*v4)
      {
        while (1)
        {
          unint64_t v6 = __ldaxr(v4);
          if ((NSAutoreleasePool *)v6 != v5) {
            break;
          }
          if (!__stlxr(0LL, v4)) {
            return v5;
          }
        }

        __clrex();
      }
    }
  }

  v8.receiver = a1;
  v8.super_class = (Class)&OBJC_METACLASS___NSAutoreleasePool;
  return (NSAutoreleasePool *)objc_msgSendSuper2(&v8, sel_allocWithZone_, a3);
}

- (NSAutoreleasePool)init
{
  self->_token = (void *)_CFAutoreleasePoolPush();
  self->_reserved3 = 0LL;
  self->_reserved2 = 0LL;
  self->_reserved = 0LL;
  return self;
}

- (void)release
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  if (self->_reserved2)
  {
    v4 = _NSMethodExceptionProem((objc_class *)self, a2);
    NSLog((NSString *)@"%@: This pool has already been released, do not drain it (double release).", v4);
  }

  if (self->_reserved3)
  {
    v5 = _NSMethodExceptionProem((objc_class *)self, a2);
    NSLog((NSString *)@"%@: This pool has already been drained, do not release it (double release).", v5);
  }

  token = self->_token;
  self->_reserved2 = (void *)-1LL;
  self->_token = 0LL;
  if (token)
  {
    _CFAutoreleasePoolPop();
    if (_NSDoAPCache)
    {
      objc_removeAssociatedObjects(self);
      for (uint64_t i = 0LL; i != 4; ++i)
      {
        objc_super v8 = (unint64_t *)((char *)&_NSAPCache + 8 * i);
        if (!*v8)
        {
          while (!__ldaxr(v8))
          {
          }

          __clrex();
        }
      }
    }

    v10.receiver = self;
    v10.super_class = (Class)&OBJC_CLASS___NSAutoreleasePool;
    -[NSAutoreleasePool dealloc](&v10, sel_dealloc);
  }

+ (void)addObject:(id)anObject
{
}

- (void)drain
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  if (self->_reserved2)
  {
    v4 = _NSMethodExceptionProem((objc_class *)self, a2);
    NSLog((NSString *)@"%@: This pool has already been released, do not drain it (double release).", v4);
  }

  if (self->_reserved3)
  {
    v5 = _NSMethodExceptionProem((objc_class *)self, a2);
    NSLog((NSString *)@"%@: This pool has already been drained, do not release it (double release).", v5);
  }

  token = self->_token;
  self->_token = 0LL;
  self->_reserved3 = (void *)-1LL;
  if (token)
  {
    _CFAutoreleasePoolPop();
    if (_NSDoAPCache)
    {
      objc_removeAssociatedObjects(self);
      for (uint64_t i = 0LL; i != 4; ++i)
      {
        objc_super v8 = (unint64_t *)((char *)&_NSAPCache + 8 * i);
        if (!*v8)
        {
          while (!__ldaxr(v8))
          {
          }

          __clrex();
        }
      }
    }

    v10.receiver = self;
    v10.super_class = (Class)&OBJC_CLASS___NSAutoreleasePool;
    -[NSAutoreleasePool dealloc](&v10, sel_dealloc);
  }

- (NSAutoreleasePool)initWithCapacity:(unint64_t)a3
{
  v4 = _NSMethodExceptionProem((objc_class *)self, a2);
  NSLog((NSString *)@"%@: Do not use this init method.", v4);
  return -[NSAutoreleasePool init](self, "init");
}

- (void)addObject:(id)anObject
{
  do
  {
    unsigned int v4 = __ldaxr(&addObject__logCount);
    unsigned int v5 = v4 + 1;
  }

  while (__stlxr(v5, &addObject__logCount));
  if ((v5 & 0xF) == 1)
  {
    unint64_t v6 = _NSMethodExceptionProem((objc_class *)self, a2);
    NSLog( (NSString *)@"%@: Do not use this instance method on specific pools -- just use -autorelease instead.",  v6);
  }

  if (self->_token) {
    _CFAutoreleasePoolAddObject();
  }
}

- (NSAutoreleasePool)retain
{
  v2 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: Cannot retain an autorelease pool", _NSMethodExceptionProem((objc_class *)self, a2)), 0 reason userInfo];
  objc_exception_throw(v2);
  return (NSAutoreleasePool *)-[NSAutoreleasePool retainCount](v3, v4);
}

- (unint64_t)retainCount
{
  return 1LL;
}

- (NSAutoreleasePool)autorelease
{
  v2 = (void *)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A60], +[NSString stringWithFormat:]( NSString, "stringWithFormat:", @"%@: Cannot autorelease an autorelease pool", _NSMethodExceptionProem((objc_class *)self, a2)), 0 reason userInfo];
  objc_exception_throw(v2);
  -[NSAutoreleasePool dealloc](v3, v4);
  return result;
}

- (void)dealloc
{
  v2 = _NSMethodExceptionProem((objc_class *)self, a2);
  NSLog((NSString *)@"%@: WARNING: Do not call this method directly.\n", v2);
}

+ (unint64_t)autoreleasedObjectCount
{
  return 0LL;
}

+ (unint64_t)topAutoreleasePoolCount
{
  return 0LL;
}

+ (BOOL)autoreleasePoolExists
{
  return 0;
}

+ (unint64_t)poolCountHighWaterMark
{
  return 0LL;
}

+ (unint64_t)poolCountHighWaterResolution
{
  return 0LL;
}

+ (unint64_t)totalAutoreleasedObjects
{
  return 0LL;
}

@end