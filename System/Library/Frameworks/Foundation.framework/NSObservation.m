@interface NSObservation
+ (id)allocWithZone:(_NSZone *)a3;
- (id)_observerStorage;
- (void)_observerStorageOfSize:(unint64_t)a3;
@end

@implementation NSObservation

- (void)_observerStorageOfSize:(unint64_t)a3
{
}

- (id)_observerStorage
{
}

+ (id)allocWithZone:(_NSZone *)a3
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  if (&OBJC_CLASS___NSObservation == a1) {
    return &___placeholderObservation;
  }
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___NSObservation;
  return objc_msgSendSuper2(&v4, sel_allocWithZone_, a3);
}

@end