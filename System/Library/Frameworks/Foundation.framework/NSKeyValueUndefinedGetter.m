@interface NSKeyValueUndefinedGetter
- (NSKeyValueUndefinedGetter)initWithContainerClassID:(id)a3 key:(id)a4 containerIsa:(Class)a5;
@end

@implementation NSKeyValueUndefinedGetter

- (NSKeyValueUndefinedGetter)initWithContainerClassID:(id)a3 key:(id)a4 containerIsa:(Class)a5
{
  v12[3] = *MEMORY[0x1895F89C0];
  InstanceMethod = class_getInstanceMethod(a5, sel_valueForUndefinedKey_);
  IMP Implementation = method_getImplementation(InstanceMethod);
  v12[1] = 0LL;
  v12[2] = 0LL;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___NSKeyValueUndefinedGetter;
  v12[0] = a4;
  return -[NSKeyValueAccessor initWithContainerClassID:key:implementation:selector:extraArguments:count:]( &v11,  sel_initWithContainerClassID_key_implementation_selector_extraArguments_count_,  a3,  a4,  Implementation,  sel_valueForUndefinedKey_,  v12,  1LL);
}

@end