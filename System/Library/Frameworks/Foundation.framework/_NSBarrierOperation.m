@interface _NSBarrierOperation
+ (BOOL)_removesDependenciesAfterFinish;
- (int64_t)queuePriority;
- (void)dealloc;
- (void)main;
@end

@implementation _NSBarrierOperation

- (void)main
{
  p_lock = &self->super._iop.__lock;
  os_unfair_lock_lock(&self->super._iop.__lock);
  block = (void (**)(void))self->_block;
  self->_block = 0LL;
  os_unfair_lock_unlock(p_lock);
  block[2]();
}

+ (BOOL)_removesDependenciesAfterFinish
{
  return 1;
}

- (int64_t)queuePriority
{
  return 12LL;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1895F89C0];

  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS____NSBarrierOperation;
  -[NSOperation dealloc](&v3, sel_dealloc);
}

@end