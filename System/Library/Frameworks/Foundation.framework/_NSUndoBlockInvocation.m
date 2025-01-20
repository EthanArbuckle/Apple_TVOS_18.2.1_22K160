@interface _NSUndoBlockInvocation
- (_NSUndoBlockInvocation)initWithTarget:(id)a3 handler:(id)a4;
- (void)dealloc;
- (void)invoke;
@end

@implementation _NSUndoBlockInvocation

- (_NSUndoBlockInvocation)initWithTarget:(id)a3 handler:(id)a4
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS____NSUndoBlockInvocation;
  v5 = -[_NSUndoObject initWithTarget:](&v10, sel_initWithTarget_, a3);
  if (!v5) {
    return v5;
  }
  v6 = _Block_copy(a4);
  v5->_handler = v6;
  if (v6) {
    return v5;
  }

  objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603B38] reason:@"unable to copy handler" userInfo:0]);
  -[_NSUndoBlockInvocation dealloc](v8, v9);
  return result;
}

- (void)dealloc
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  if (self)
  {
    id handler = self->_handler;
    if (handler)
    {
      _Block_release(handler);
      self->_id handler = 0LL;
    }
  }

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS____NSUndoBlockInvocation;
  -[_NSUndoBlockInvocation dealloc](&v4, sel_dealloc);
}

- (void)invoke
{
}

@end