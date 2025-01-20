@interface _NSUndoLightInvocation
- (_NSUndoLightInvocation)initWithTarget:(id)a3 selector:(SEL)a4 object:(id)a5;
- (id)_argument;
- (id)description;
- (void)dealloc;
- (void)invoke;
@end

@implementation _NSUndoLightInvocation

- (_NSUndoLightInvocation)initWithTarget:(id)a3 selector:(SEL)a4 object:(id)a5
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS____NSUndoLightInvocation;
  v7 = -[_NSUndoObject initWithTarget:](&v9, sel_initWithTarget_, a3);
  v7->_selector = a4;
  v7->_arg = a5;
  return v7;
}

- (void)invoke
{
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1895F89C0];

  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS____NSUndoLightInvocation;
  -[_NSUndoLightInvocation dealloc](&v3, sel_dealloc);
}

- (id)_argument
{
  return self->_arg;
}

- (id)description
{
  objc_super v3 = (objc_class *)objc_opt_class();
  uint64_t v4 = NSStringFromClass(v3);
  id target = self->super._target;
  v6 = NSStringFromSelector(self->_selector);
  if (self->_arg)
  {
    v7 = (objc_class *)objc_opt_class();
    v8 = NSStringFromClass(v7);
    id arg = self->_arg;
  }

  else
  {
    id arg = 0LL;
    v8 = (NSString *)@"none";
  }

  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"target: %@ %p -- selector:%@ -- arg:%@ %p",  v4,  target,  v6,  v8,  arg);
}

@end