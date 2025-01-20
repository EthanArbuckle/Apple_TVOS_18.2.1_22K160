@interface _PFAutoreleasePoolThunk
+ (void)thunkWithBlock:(uint64_t)a1;
- (void)dealloc;
- (void)initWithBlock:(void *)a1;
@end

@implementation _PFAutoreleasePoolThunk

+ (void)thunkWithBlock:(uint64_t)a1
{
  id v3 = objc_alloc((Class)objc_opt_self());
  return -[_PFAutoreleasePoolThunk initWithBlock:](v3, a2);
}

- (void)initWithBlock:(void *)a1
{
  if (!a1) {
    return 0LL;
  }
  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_CLASS____PFAutoreleasePoolThunk;
  id v3 = objc_msgSendSuper2(&v5, sel_init);
  if (v3) {
    v3[1] = _Block_copy(a2);
  }
  return v3;
}

- (void)dealloc
{
  id v3 = (void *)MEMORY[0x186E3E5D8](self, a2);
  (*((void (**)(void))self->_action + 2))();
  _Block_release(self->_action);
  objc_autoreleasePoolPop(v3);
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS____PFAutoreleasePoolThunk;
  -[_PFAutoreleasePoolThunk dealloc](&v4, sel_dealloc);
}

@end