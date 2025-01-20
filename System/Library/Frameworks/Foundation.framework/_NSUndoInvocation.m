@interface _NSUndoInvocation
- (_NSUndoInvocation)initWithTarget:(id)a3 invocation:(id)a4;
- (id)description;
- (void)dealloc;
- (void)invoke;
@end

@implementation _NSUndoInvocation

- (_NSUndoInvocation)initWithTarget:(id)a3 invocation:(id)a4
{
  v5 = -[_NSUndoObject initWithTarget:](self, "initWithTarget:", a3);
  v6 = (NSInvocation *)a4;
  v5->_invocation = v6;
  -[NSInvocation retainArguments](v6, "retainArguments");
  return v5;
}

- (void)invoke
{
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1895F89C0];

  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS____NSUndoInvocation;
  -[_NSUndoInvocation dealloc](&v3, sel_dealloc);
}

- (id)description
{
  objc_super v3 = (objc_class *)objc_opt_class();
  uint64_t v4 = NSStringFromClass(v3);
  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"target: %@ %p -- selector:%@",  v4,  self->super._target,  NSStringFromSelector(-[NSInvocation selector](self->_invocation, "selector")));
}

@end