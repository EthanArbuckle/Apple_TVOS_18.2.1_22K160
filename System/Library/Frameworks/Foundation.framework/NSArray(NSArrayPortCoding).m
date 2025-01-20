@interface NSArray(NSArrayPortCoding)
- (id)replacementObjectForPortCoder:()NSArrayPortCoding;
@end

@implementation NSArray(NSArrayPortCoding)

- (id)replacementObjectForPortCoder:()NSArrayPortCoding
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  if ([a3 isByref])
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_CLASS___NSArray_0;
    return objc_msgSendSuper2(&v6, sel_replacementObjectForPortCoder_, a3);
  }

  return a1;
}

@end