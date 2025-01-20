@interface __SwiftNativeNSArrayBase
+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3;
+ (id)new;
- (BOOL)_tryRetain;
- (BOOL)allowsWeakReference;
- (BOOL)retainWeakReference;
- (__SwiftNativeNSArrayBase)initWithCoder:(id)a3;
- (__SwiftNativeNSArrayBase)retain;
- (void)_noteAssociatedObjects;
- (void)_setWeaklyReferenced;
@end

@implementation __SwiftNativeNSArrayBase

- (__SwiftNativeNSArrayBase)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS_____SwiftNativeNSArrayBase;
  return -[__SwiftNativeNSArrayBase init](&v4, sel_init, a3);
}

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  return 0;
}

- (__SwiftNativeNSArrayBase)retain
{
  return self;
}

- (BOOL)_tryRetain
{
  return swift_tryRetain((uint64_t)self, (uint64_t)a2, v2, v3) != 0;
}

- (BOOL)allowsWeakReference
{
  return swift_isDeallocating((uint64_t)self) ^ 1;
}

- (BOOL)retainWeakReference
{
  return swift_tryRetain((uint64_t)self, (uint64_t)a2, v2, v3) != 0;
}

- (void)_setWeaklyReferenced
{
  Class isa = self[1].super.isa;
  if (((unint64_t)isa & 0x8000000000000001LL) == 1)
  {
    v3 = (unint64_t *)&self[1];
    unint64_t v4 = __ldxr((unint64_t *)&self[1]);
    if ((Class)v4 != isa)
    {
      __clrex();
      while (1)
      {
LABEL_10:
        unint64_t v5 = __ldxr(v3);
        if (v5 == v4)
        {
          if (!__stxr(v4 & 0xFFFFFFFFFFFFFFFELL, v3)) {
            return;
          }
        }

        else
        {
          __clrex();
        }

        unint64_t v4 = v5;
      }
    }
  }

- (void)_noteAssociatedObjects
{
  Class isa = self[1].super.isa;
  if (((unint64_t)isa & 0x8000000000000001LL) == 1)
  {
    v3 = (unint64_t *)&self[1];
    unint64_t v4 = __ldxr((unint64_t *)&self[1]);
    if ((Class)v4 != isa)
    {
      __clrex();
      while (1)
      {
LABEL_10:
        unint64_t v5 = __ldxr(v3);
        if (v5 == v4)
        {
          if (!__stxr(v4 & 0xFFFFFFFFFFFFFFFELL, v3)) {
            return;
          }
        }

        else
        {
          __clrex();
        }

        unint64_t v4 = v5;
      }
    }
  }

+ (id)new
{
  return (id)objc_opt_new();
}

@end