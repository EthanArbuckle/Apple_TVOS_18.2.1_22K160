@interface NSArray
@end

@implementation NSArray

IMP __36__NSArray_NSArray__encodeWithCoder___block_invoke(uint64_t a1)
{
  _MergedGlobals_89 = (uint64_t)class_getMethodImplementation((Class)&OBJC_CLASS___NSKeyedArchiver, *(SEL *)(a1 + 32));
  IMP result = class_getMethodImplementation((Class)&OBJC_CLASS___NSXPCEncoder, *(SEL *)(a1 + 32));
  qword_18C496530 = (uint64_t)result;
  return result;
}

@end