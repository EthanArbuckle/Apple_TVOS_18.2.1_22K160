@interface NSAutoContentAccessingProxy
+ (id)proxyWithTarget:(id)a3;
- (id)forwardingTargetForSelector:(SEL)a3;
- (id)methodSignatureForSelector:(SEL)a3;
- (void)dealloc;
- (void)forwardInvocation:(id)a3;
@end

@implementation NSAutoContentAccessingProxy

+ (id)proxyWithTarget:(id)a3
{
  if (![a3 conformsToProtocol:&unk_18C65FCC8]
    || ![a3 beginContentAccess])
  {
    return 0LL;
  }

  v4 = objc_alloc(&OBJC_CLASS___NSAutoContentAccessingProxy);
  v4->_target = a3;
  return v4;
}

- (id)forwardingTargetForSelector:(SEL)a3
{
  return self->_target;
}

- (id)methodSignatureForSelector:(SEL)a3
{
  return (id)[self->_target methodSignatureForSelector:a3];
}

- (void)forwardInvocation:(id)a3
{
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  [self->_target endContentAccess];

  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSAutoContentAccessingProxy;
  -[NSProxy dealloc](&v3, sel_dealloc);
}

@end