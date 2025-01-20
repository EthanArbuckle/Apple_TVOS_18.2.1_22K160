@interface __NSCFData
+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3;
+ (id)allocWithZone:(_NSZone *)a3;
- (BOOL)_isDeallocating;
- (BOOL)_providesConcreteBacking;
- (BOOL)_tryRetain;
- (BOOL)isEqual:(id)a3;
- (Class)classForCoder;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setLength:(unint64_t)a3;
@end

@implementation __NSCFData

- (BOOL)isEqual:(id)a3
{
  if (!a3) {
    return 0;
  }
  if (self == a3) {
    return 1;
  }
  return _CFNonObjCEqual((unint64_t *)self, (unint64_t *)a3) != 0;
}

- (BOOL)_tryRetain
{
  return _CFTryRetain((unint64_t *)self) != 0LL;
}

- (BOOL)_isDeallocating
{
  return _CFIsDeallocating((uint64_t)self) != 0;
}

+ (id)allocWithZone:(_NSZone *)a3
{
  return 0LL;
}

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS_____NSCFData;
  return -[__NSCFData copyWithZone:](&v6, sel_copyWithZone_, a3);
}

- (void)setLength:(unint64_t)a3
{
}

- (BOOL)_providesConcreteBacking
{
  return 1;
}

- (Class)classForCoder
{
  return (Class)objc_opt_self();
}

@end