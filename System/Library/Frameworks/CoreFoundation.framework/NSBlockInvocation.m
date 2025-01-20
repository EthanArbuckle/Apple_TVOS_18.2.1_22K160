@interface NSBlockInvocation
- (SEL)selector;
- (void)invoke;
- (void)invokeSuper;
- (void)invokeUsingIMP:(void *)a3;
- (void)setSelector:(SEL)a3;
@end

@implementation NSBlockInvocation

- (SEL)selector
{
  SEL result = (SEL)-[NSObject doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __break(1u);
  return result;
}

- (void)setSelector:(SEL)a3
{
}

- (void)invoke
{
  uint64_t v3 = *MEMORY[0x1895F89C0];
  v2.receiver = self;
  v2.super_class = (Class)&OBJC_CLASS___NSBlockInvocation;
  -[NSInvocation invoke](&v2, sel_invoke);
}

- (void)invokeUsingIMP:(void *)a3
{
}

- (void)invokeSuper
{
}

@end