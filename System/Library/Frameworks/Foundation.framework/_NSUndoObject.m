@interface _NSUndoObject
- (BOOL)isBeginMark;
- (BOOL)isEndMark;
- (_NSUndoObject)init;
- (_NSUndoObject)initWithTarget:(id)a3;
- (id)target;
- (void)invoke;
@end

@implementation _NSUndoObject

- (_NSUndoObject)init
{
  return -[_NSUndoObject initWithTarget:](self, "initWithTarget:", 0LL);
}

- (_NSUndoObject)initWithTarget:(id)a3
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS____NSUndoObject;
  result = -[_NSUndoObject init](&v5, sel_init);
  result->_target = a3;
  return result;
}

- (BOOL)isBeginMark
{
  return 0;
}

- (BOOL)isEndMark
{
  return 0;
}

- (void)invoke
{
}

- (id)target
{
  return self->_target;
}

@end