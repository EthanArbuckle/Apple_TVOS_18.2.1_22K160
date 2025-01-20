@interface NSKeyValueProxyGetter
- (Class)proxyClass;
- (NSKeyValueProxyGetter)initWithContainerClassID:(id)a3 key:(id)a4 proxyClass:(Class)a5;
@end

@implementation NSKeyValueProxyGetter

- (NSKeyValueProxyGetter)initWithContainerClassID:(id)a3 key:(id)a4 proxyClass:(Class)a5
{
  v8[3] = *MEMORY[0x1895F89C0];
  v8[1] = 0LL;
  v8[2] = 0LL;
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___NSKeyValueProxyGetter;
  v8[0] = self;
  result = -[NSKeyValueAccessor initWithContainerClassID:key:implementation:selector:extraArguments:count:]( &v7,  sel_initWithContainerClassID_key_implementation_selector_extraArguments_count_,  a3,  a4,  _NSGetProxyValueWithGetter,  0LL,  v8,  1LL);
  if (result) {
    result->_proxyClass = a5;
  }
  return result;
}

- (Class)proxyClass
{
  return self->_proxyClass;
}

@end