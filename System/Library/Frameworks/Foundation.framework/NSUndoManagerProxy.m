@interface NSUndoManagerProxy
- (BOOL)_tryRetain;
- (BOOL)isKindOfClass:(Class)a3;
- (NSUndoManagerProxy)initWithManager:(id)a3;
- (NSUndoManagerProxy)retain;
- (id)methodSignatureForSelector:(SEL)a3;
- (void)forwardInvocation:(id)a3;
- (void)release;
- (void)setTargetClass:(Class)a3;
- (void)superRelease;
@end

@implementation NSUndoManagerProxy

- (NSUndoManagerProxy)initWithManager:(id)a3
{
  self->_manager = (NSUndoManager *)a3;
  return self;
}

- (void)setTargetClass:(Class)a3
{
  self->_targetClass = a3;
}

- (NSUndoManagerProxy)retain
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  v3 = self->_manager;
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___NSUndoManagerProxy;
  return -[NSProxy retain](&v5, sel_retain);
}

- (BOOL)_tryRetain
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___NSUndoManagerProxy;
  BOOL v3 = -[NSProxy _tryRetain](&v6, sel__tryRetain);
  if (v3) {
    v4 = self->_manager;
  }
  return v3;
}

- (void)release
{
  uint64_t v4 = *MEMORY[0x1895F89C0];

  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSUndoManagerProxy;
  -[NSProxy release](&v3, sel_release);
}

- (void)superRelease
{
  uint64_t v3 = *MEMORY[0x1895F89C0];
  v2.receiver = self;
  v2.super_class = (Class)&OBJC_CLASS___NSUndoManagerProxy;
  -[NSProxy release](&v2, sel_release);
}

- (id)methodSignatureForSelector:(SEL)a3
{
  return -[NSUndoManager _methodSignatureForTargetSelector:](self->_manager, "_methodSignatureForTargetSelector:", a3);
}

- (void)forwardInvocation:(id)a3
{
}

- (BOOL)isKindOfClass:(Class)a3
{
  targetClass = self->_targetClass;
  BOOL v4 = targetClass != 0LL;
  if (targetClass != a3 && targetClass != 0LL)
  {
    do
    {
      targetClass = class_getSuperclass(targetClass);
      BOOL v4 = targetClass != 0LL;
    }

    while (targetClass != a3 && targetClass);
  }

  return v4;
}

@end