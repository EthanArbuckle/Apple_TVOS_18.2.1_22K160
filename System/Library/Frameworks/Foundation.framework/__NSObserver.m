@interface __NSObserver
+ (void)observerWithCenter:(uint64_t)a1;
- (id)block;
- (unint64_t)token;
- (void)dealloc;
- (void)setBlock:(id)a3;
- (void)setToken:(unint64_t)a3;
@end

@implementation __NSObserver

- (unint64_t)token
{
  return self->_token;
}

- (void)dealloc
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  os_unfair_lock_lock(&_MergedGlobals_9);
  nc = self->nc;
  self->nc = 0LL;
  os_unfair_lock_unlock(&_MergedGlobals_9);
  id block = self->_block;
  if (block) {
    _Block_release(block);
  }
  -[NSNotificationCenter removeObserver:](nc, "removeObserver:", self);

  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS_____NSObserver;
  -[__NSObserver dealloc](&v5, sel_dealloc);
}

+ (void)observerWithCenter:(uint64_t)a1
{
  v3 = (void *)objc_opt_new();
  v3[1] = a2;
  if (qword_18C4964E0 != -1) {
    dispatch_once(&qword_18C4964E0, &__block_literal_global_26);
  }
  os_unfair_lock_lock(&_MergedGlobals_9);
  CFSetAddValue((CFMutableSetRef)qword_18C4964E8, v3);
  os_unfair_lock_unlock(&_MergedGlobals_9);
  return v3;
}

- (void)setToken:(unint64_t)a3
{
  self->_token = a3;
}

- (id)block
{
  return objc_getProperty(self, a2, 24LL, 1);
}

- (void)setBlock:(id)a3
{
}

@end