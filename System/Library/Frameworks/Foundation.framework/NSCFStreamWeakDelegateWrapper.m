@interface NSCFStreamWeakDelegateWrapper
- (NSCFStreamWeakDelegateWrapper)initWithDelegate:(id)a3;
- (id)retainedDelegate;
- (void)dealloc;
@end

@implementation NSCFStreamWeakDelegateWrapper

- (NSCFStreamWeakDelegateWrapper)initWithDelegate:(id)a3
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___NSCFStreamWeakDelegateWrapper;
  v3 = -[NSCFStreamWeakDelegateWrapper init](&v5, sel_init);
  if (v3) {
    _NSObjectStoreWeak();
  }
  return v3;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  _NSObjectStoreWeak();
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSCFStreamWeakDelegateWrapper;
  -[NSCFStreamWeakDelegateWrapper dealloc](&v3, sel_dealloc);
}

- (id)retainedDelegate
{
  return (id)_NSObjectLoadWeakRetained();
}

@end