@interface __NSCFURLLocalStreamTaskWorkBlockOp
+ (void)opWithBlock:(uint64_t)a3 description:;
- (void)dealloc;
@end

@implementation __NSCFURLLocalStreamTaskWorkBlockOp

- (void)dealloc
{
  id block = self->_block;
  if (block)
  {
    _Block_release(block);
    self->_id block = 0LL;
  }

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS_____NSCFURLLocalStreamTaskWorkBlockOp;
  -[__NSCFURLLocalStreamTaskWorkBlockOp dealloc](&v4, sel_dealloc);
}

+ (void)opWithBlock:(uint64_t)a3 description:
{
  v5 = objc_alloc(&OBJC_CLASS_____NSCFURLLocalStreamTaskWorkBlockOp);
  if (!v5)
  {
    v7 = 0LL;
    if (!a2) {
      return v7;
    }
    goto LABEL_5;
  }

  uint64_t v6 = -[__NSCFURLLocalStreamTaskWorkBlockOp init](v5, "init");
  v7 = (void *)v6;
  if (v6) {
    *(void *)(v6 + 8) = a3;
  }
  if (a2) {
LABEL_5:
  }
    v7[6] = _Block_copy(a2);
  return v7;
}

@end