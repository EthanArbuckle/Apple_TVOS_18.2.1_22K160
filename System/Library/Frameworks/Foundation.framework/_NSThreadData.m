@interface _NSThreadData
- (_NSThreadData)init;
@end

@implementation _NSThreadData

- (_NSThreadData)init
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS____NSThreadData;
  return -[_NSThreadData init](&v3, sel_init);
}

@end