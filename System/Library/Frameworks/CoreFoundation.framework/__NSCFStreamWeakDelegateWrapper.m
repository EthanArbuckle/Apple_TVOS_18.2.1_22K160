@interface __NSCFStreamWeakDelegateWrapper
- (__NSCFStreamWeakDelegateWrapper)initWithDelegate:(id)a3;
- (id)retainedDelegate;
- (void)dealloc;
@end

@implementation __NSCFStreamWeakDelegateWrapper

- (__NSCFStreamWeakDelegateWrapper)initWithDelegate:(id)a3
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS_____NSCFStreamWeakDelegateWrapper;
  v4 = -[__NSCFStreamWeakDelegateWrapper init](&v7, sel_init);
  v5 = v4;
  if (v4) {
    _NSObjectStoreWeak((id *)&v4->_object, a3, &v4->_useFallback);
  }
  return v5;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  _NSObjectStoreWeak((id *)&self->_object, 0LL, &self->_useFallback);
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS_____NSCFStreamWeakDelegateWrapper;
  -[__NSCFStreamWeakDelegateWrapper dealloc](&v3, sel_dealloc);
}

- (id)retainedDelegate
{
  return _NSObjectLoadWeakRetained((id *)&self->_object, &self->_useFallback);
}

@end