@interface __NSDictionaryObjectEnumerator
- (id)nextObject;
@end

@implementation __NSDictionaryObjectEnumerator

- (id)nextObject
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS_____NSDictionaryObjectEnumerator;
  id result = -[__NSFastEnumerationEnumerator nextObject](&v4, sel_nextObject);
  if (result) {
    return (id)[self->super._origObj objectForKey:result];
  }
  return result;
}

@end