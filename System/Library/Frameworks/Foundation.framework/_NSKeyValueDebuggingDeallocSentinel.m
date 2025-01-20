@interface _NSKeyValueDebuggingDeallocSentinel
+ (void)_invalidateSentinelWithKey:(void *)a3 fromObject:(id)a4;
- (_NSKeyValueDebuggingDeallocSentinel)initWithObjectPointer:(unint64_t)a3 callbackBlock:(id)a4;
- (void)dealloc;
- (void)invalidate;
@end

@implementation _NSKeyValueDebuggingDeallocSentinel

+ (void)_invalidateSentinelWithKey:(void *)a3 fromObject:(id)a4
{
}

- (_NSKeyValueDebuggingDeallocSentinel)initWithObjectPointer:(unint64_t)a3 callbackBlock:(id)a4
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS____NSKeyValueDebuggingDeallocSentinel;
  v6 = -[_NSKeyValueDebuggingDeallocSentinel init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_isInvalid = 0;
    v6->_objectPointer = a3;
    v6->_callbackBlock = (id)[a4 copy];
  }

  return v7;
}

- (void)invalidate
{
  p_isInvalid = &self->_isInvalid;
  do
    unsigned __int8 v4 = __ldaxr((unsigned __int8 *)p_isInvalid);
  while (__stlxr(1u, (unsigned __int8 *)p_isInvalid));
  if ((v4 & 1) == 0)
  {

    self->_callbackBlock = 0LL;
  }

- (void)dealloc
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  unsigned __int8 v3 = atomic_load((unsigned __int8 *)&self->_isInvalid);
  if ((v3 & 1) == 0)
  {
    (*((void (**)(void))self->_callbackBlock + 2))();
  }

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS____NSKeyValueDebuggingDeallocSentinel;
  -[_NSKeyValueDebuggingDeallocSentinel dealloc](&v4, sel_dealloc);
}

@end