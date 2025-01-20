@interface NSSet(NSSetPortCoding)
- (id)replacementObjectForPortCoder:()NSSetPortCoding;
@end

@implementation NSSet(NSSetPortCoding)

- (id)replacementObjectForPortCoder:()NSSetPortCoding
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  if ([a3 isByref])
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_CLASS___NSSet_0;
    return objc_msgSendSuper2(&v6, sel_replacementObjectForPortCoder_, a3);
  }

  return a1;
}

@end