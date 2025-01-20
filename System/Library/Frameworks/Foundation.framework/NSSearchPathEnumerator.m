@interface NSSearchPathEnumerator
- (NSSearchPathEnumerator)initWithDirectory:(unint64_t)a3 domains:(unint64_t)a4;
- (id)nextObject;
@end

@implementation NSSearchPathEnumerator

- (NSSearchPathEnumerator)initWithDirectory:(unint64_t)a3 domains:(unint64_t)a4
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___NSSearchPathEnumerator;
  v6 = -[NSSearchPathEnumerator init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->directory = a3;
    v6->domainMask = a4;
    v6->state = __CFStartSearchPathEnumeration();
  }

  return v7;
}

- (id)nextObject
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  id result = (id)__CFGetNextSearchPathEnumeration();
  self->state = (int64_t)result;
  if (result) {
    return -[NSFileManager stringWithFileSystemRepresentation:length:]( +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"),  "stringWithFileSystemRepresentation:length:",  __s,  strlen(__s));
  }
  return result;
}

@end