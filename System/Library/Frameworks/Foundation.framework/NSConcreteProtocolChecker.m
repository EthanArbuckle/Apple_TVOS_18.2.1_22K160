@interface NSConcreteProtocolChecker
- (NSConcreteProtocolChecker)initWithTarget:(id)a3 protocol:(id)a4;
- (id)protocol;
- (id)target;
- (void)dealloc;
@end

@implementation NSConcreteProtocolChecker

- (id)protocol
{
  return self->_protocol;
}

- (id)target
{
  return self->_target;
}

- (NSConcreteProtocolChecker)initWithTarget:(id)a3 protocol:(id)a4
{
  self->_target = a3;
  self->_protocol = (Protocol *)a4;
  return self;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1895F89C0];

  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSConcreteProtocolChecker;
  -[NSProxy dealloc](&v3, sel_dealloc);
}

@end