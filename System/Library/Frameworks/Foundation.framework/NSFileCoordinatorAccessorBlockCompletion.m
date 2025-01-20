@interface NSFileCoordinatorAccessorBlockCompletion
+ (id)completionWithBlock:(id)a3;
- (void)dealloc;
- (void)decrement;
- (void)increment;
@end

@implementation NSFileCoordinatorAccessorBlockCompletion

+ (id)completionWithBlock:(id)a3
{
  if (!a3) {
    return 0LL;
  }
  id v4 = (id)objc_opt_new();
  *((void *)v4 + 1) = [a3 copy];
  atomic_store(1u, (unsigned int *)v4 + 4);
  return v4;
}

- (void)dealloc
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  int v3 = atomic_load((unsigned int *)&self->count);
  if (v3 >= 1) {
    (*((void (**)(void))self->block + 2))();
  }

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___NSFileCoordinatorAccessorBlockCompletion;
  -[NSFileCoordinatorAccessorBlockCompletion dealloc](&v4, sel_dealloc);
}

- (void)increment
{
  p_count = &self->count;
  do
    unsigned int v3 = __ldaxr((unsigned int *)p_count);
  while (__stlxr(v3 + 1, (unsigned int *)p_count));
  if (!v3)
  {
    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A58] reason:@"Accessor completion counter should never be incremented from 0 to 1" userInfo:0]);
    -[NSFileCoordinatorAccessorBlockCompletion decrement](v4, v5);
  }

- (void)decrement
{
  p_count = &self->count;
  do
    unsigned int v4 = __ldaxr((unsigned int *)p_count);
  while (__stlxr(v4 - 1, (unsigned int *)p_count));
  if (v4 != 1)
  {
    if (v4) {
      return;
    }
    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A58] reason:@"Accessor completion counter over-decremented" userInfo:0]);
  }

  (*((void (**)(void))self->block + 2))();

  self->block = 0LL;
}

@end