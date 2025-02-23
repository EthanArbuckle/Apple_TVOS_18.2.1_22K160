@interface NSFileCoordinatorReacquisitionBlockCompletion
+ (id)completionWithBlock:(id)a3 queue:(id)a4;
- (void)dealloc;
- (void)decrement;
- (void)increment;
@end

@implementation NSFileCoordinatorReacquisitionBlockCompletion

+ (id)completionWithBlock:(id)a3 queue:(id)a4
{
  if (!a3) {
    return 0LL;
  }
  v6 = (dispatch_group_t *)(id)objc_opt_new();
  v7 = dispatch_group_create();
  v6[1] = v7;
  dispatch_group_enter(v7);
  dispatch_group_notify(v6[1], (dispatch_queue_t)a4, a3);
  return v6;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  dispatch_release((dispatch_object_t)self->group);
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSFileCoordinatorReacquisitionBlockCompletion;
  -[NSFileCoordinatorReacquisitionBlockCompletion dealloc](&v3, sel_dealloc);
}

- (void)increment
{
}

- (void)decrement
{
}

@end