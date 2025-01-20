@interface _SwiftObject
+ (BOOL)_isDeallocating;
+ (BOOL)_tryRetain;
+ (BOOL)allowsWeakReference;
+ (BOOL)conformsToProtocol:(id)a3;
+ (BOOL)instancesRespondToSelector:(SEL)a3;
+ (BOOL)isMemberOfClass:(Class)a3;
+ (BOOL)isSubclassOfClass:(Class)a3;
+ (BOOL)respondsToSelector:(SEL)a3;
+ (BOOL)retainWeakReference;
+ (Class)superclass;
+ (_TtCs12_SwiftObject)alloc;
+ (_TtCs12_SwiftObject)allocWithZone:(_NSZone *)a3;
+ (id)debugDescription;
+ (id)description;
+ (unint64_t)retainCount;
+ (void)instanceMethodForSelector:(SEL)a3;
+ (void)methodForSelector:(SEL)a3;
- (BOOL)_tryRetain;
- (BOOL)allowsWeakReference;
- (BOOL)conformsToProtocol:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isKindOfClass:(Class)a3;
- (BOOL)isMemberOfClass:(Class)a3;
- (BOOL)isNSArray__;
- (BOOL)isNSCFConstantString__;
- (BOOL)isNSData__;
- (BOOL)isNSDate__;
- (BOOL)isNSDictionary__;
- (BOOL)isNSNumber__;
- (BOOL)isNSObject__;
- (BOOL)isNSOrderedSet__;
- (BOOL)isNSSet__;
- (BOOL)isNSString__;
- (BOOL)isNSTimeZone__;
- (BOOL)isNSValue__;
- (BOOL)isProxy;
- (BOOL)respondsToSelector:(SEL)a3;
- (BOOL)retainWeakReference;
- (Class)class;
- (Class)superclass;
- (NSString)debugDescription;
- (NSString)description;
- (_NSZone)zone;
- (_TtCs12_SwiftObject)retain;
- (id)_copyDescription;
- (id)performSelector:(SEL)a3;
- (id)performSelector:(SEL)a3 withObject:(id)a4;
- (id)performSelector:(SEL)a3 withObject:(id)a4 withObject:(id)a5;
- (unint64_t)_cfTypeID;
- (unint64_t)hash;
- (void)_noteAssociatedObjects;
- (void)_setWeaklyReferenced;
- (void)doesNotRecognizeSelector:(SEL)a3;
- (void)methodForSelector:(SEL)a3;
@end

@implementation _SwiftObject

+ (_TtCs12_SwiftObject)allocWithZone:(_NSZone *)a3
{
  size_t InstanceSize = class_getInstanceSize((Class)a1);
  return (_TtCs12_SwiftObject *)swift_allocObject((uint64_t)a1, InstanceSize, 0xFuLL);
}

+ (_TtCs12_SwiftObject)alloc
{
  size_t InstanceSize = class_getInstanceSize((Class)a1);
  return (_TtCs12_SwiftObject *)swift_allocObject((uint64_t)a1, InstanceSize, 0xFuLL);
}

- (Class)class
{
  return (Class)((uint64_t)self->isa & 0xFFFFFFFF8LL);
}

+ (Class)superclass
{
  return (Class)*((void *)a1 + 1);
}

- (Class)superclass
{
  return *(Class *)(((uint64_t)self->isa & 0xFFFFFFFF8LL) + 8);
}

+ (BOOL)isMemberOfClass:(Class)a3
{
  return (*(void *)a1 & 0xFFFFFFFF8LL) == (void)a3;
}

- (BOOL)isMemberOfClass:(Class)a3
{
  return ((uint64_t)self->isa & 0xFFFFFFFF8LL) == (void)a3;
}

- (BOOL)isProxy
{
  return 0;
}

- (_NSZone)zone
{
  result = (_NSZone *)malloc_zone_from_ptr(self);
  if (!result) {
    return (_NSZone *)malloc_default_zone();
  }
  return result;
}

- (void)doesNotRecognizeSelector:(SEL)a3
{
  v4 = (objc_class *)((uint64_t)self->isa & 0xFFFFFFFF8LL);
  BOOL isMetaClass = class_isMetaClass(v4);
  Name = class_getName(v4);
  v10 = sel_getName(a3);
  uint64_t v8 = 45LL;
  if (isMetaClass) {
    uint64_t v8 = 43LL;
  }
  swift::fatalError(0LL, "Unrecognized selector %c[%s %s]\n", v6, v7, v8, Name, v10);
}

- (_TtCs12_SwiftObject)retain
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
  Class isa = self[1].isa;
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
  Class isa = self[1].isa;
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

+ (unint64_t)retainCount
{
  return -1LL;
}

+ (BOOL)_isDeallocating
{
  return 0;
}

+ (BOOL)_tryRetain
{
  return 1;
}

+ (BOOL)allowsWeakReference
{
  return 1;
}

+ (BOOL)retainWeakReference
{
  return 1;
}

- (BOOL)isKindOfClass:(Class)a3
{
  Class isa = (objc_class *)((uint64_t)self->isa & 0xFFFFFFFF8LL);
  for (BOOL i = isa == 0LL; ; BOOL i = isa == 0LL)
  {
    BOOL result = !i;
    if (isa == a3 || isa == 0LL) {
      break;
    }
    Class isa = isa[1].isa;
  }

  return result;
}

+ (BOOL)isSubclassOfClass:(Class)a3
{
  BOOL v3 = a1 != 0LL;
  if (a1 != a3 && a1)
  {
    do
    {
      a1 = (id)*((void *)a1 + 1);
      BOOL v3 = a1 != 0LL;
    }

    while (a1 != a3 && a1 != 0LL);
  }

  return v3;
}

+ (BOOL)respondsToSelector:(SEL)a3
{
  return a3 && class_respondsToSelector((Class)(*(void *)a1 & 0xFFFFFFFF8LL), a3);
}

- (BOOL)respondsToSelector:(SEL)a3
{
  return a3 && class_respondsToSelector((Class)((uint64_t)self->isa & 0xFFFFFFFF8LL), a3);
}

+ (BOOL)instancesRespondToSelector:(SEL)a3
{
  return a3 && class_respondsToSelector((Class)a1, a3);
}

+ (void)methodForSelector:(SEL)a3
{
  Class = object_getClass(a1);
  return class_getMethodImplementation(Class, a3);
}

- (void)methodForSelector:(SEL)a3
{
  Class = object_getClass(self);
  return class_getMethodImplementation(Class, a3);
}

+ (void)instanceMethodForSelector:(SEL)a3
{
  return class_getMethodImplementation((Class)a1, a3);
}

- (BOOL)conformsToProtocol:(id)a3
{
  if (!a3) {
    return 0;
  }
  Superclass = (objc_class *)((uint64_t)self->isa & 0xFFFFFFFF8LL);
  if (!Superclass) {
    return 0;
  }
  do
  {
    BOOL v5 = class_conformsToProtocol(Superclass, (Protocol *)a3);
    if (v5) {
      break;
    }
    Superclass = class_getSuperclass(Superclass);
  }

  while (Superclass);
  return v5;
}

+ (BOOL)conformsToProtocol:(id)a3
{
  BOOL v3 = 0;
  if (a3)
  {
    Superclass = (objc_class *)a1;
    if (a1)
    {
      do
      {
        BOOL v3 = class_conformsToProtocol(Superclass, (Protocol *)a3);
        if (v3) {
          break;
        }
        Superclass = class_getSuperclass(Superclass);
      }

      while (Superclass);
    }
  }

  return v3;
}

- (unint64_t)hash
{
  uint64_t v2 = self;
  v12 = self;
  if (!swift::runtime::bincompat::useLegacySwiftObjCHashing((swift::runtime::bincompat *)self))
  {
    uint64_t v3 = (uint64_t)v2->isa & 0xFFFFFFFF8LL;
    uint64_t v4 = swift_conformsToProtocolCommon(v3, (uint64_t)&protocol descriptor for Hashable);
    if (v4)
    {
      return _getErrorCode<A>(_:)(&v12, v3, v4);
    }

    else if (swift_conformsToProtocolCommon(v3, (uint64_t)&protocol descriptor for Equatable))
    {
      uint64_t v11 = objc_opt_class();
      os_unfair_lock_lock((os_unfair_lock_t)&-[_TtCs12_SwiftObject hash]::warnedLock);
      if (qword_18C5759C8 != -1) {
        dispatch_once_f( &qword_18C5759C8,  &-[_TtCs12_SwiftObject hash]::warned,  (dispatch_function_t)swift::Lazy<std::unordered_set<objc_class *>>::defaultInitCallback);
      }
      std::__hash_table<objc_class *,std::hash<objc_class *>,std::equal_to<objc_class *>,std::allocator<objc_class *>>::__emplace_unique_key_args<objc_class *,objc_class * const&>( (uint64_t)&-[_TtCs12_SwiftObject hash]::warned,  &v11,  &v11);
      if (v5)
      {
        v6 = (objc_class *)objc_opt_class();
        Name = class_getName(v6);
          "ead to severe performance problems.\n",
          v8,
          v9,
          Name);
      }

      os_unfair_lock_unlock((os_unfair_lock_t)&-[_TtCs12_SwiftObject hash]::warnedLock);
      return 1LL;
    }
  }

  return (unint64_t)v2;
}

- (BOOL)isEqual:(id)a3
{
  id v10 = a3;
  uint64_t v11 = self;
  if (self == a3)
  {
    LOBYTE(v6) = 1;
    return v6 & 1;
  }

  if ((swift::runtime::bincompat::useLegacySwiftObjCHashing((swift::runtime::bincompat *)self) & 1) != 0) {
    goto LABEL_6;
  }
  uint64_t v5 = (uint64_t)self->isa & 0xFFFFFFFF8LL;
  uint64_t v6 = swift_conformsToProtocolCommon(v5, (uint64_t)&protocol descriptor for Equatable);
  if (v6)
  {
    uint64_t v7 = v6;
    ConformingSuperclass = (uint64_t *)swift::findConformingSuperclass(v5, *(void *)v6);
    if ((_swift_class_isSubclass(*(void *)a3 & 0xFFFFFFFF8LL, ConformingSuperclass) & 1) != 0)
    {
      LOBYTE(v6) = _swift_stdlib_Equatable_isEqual_indirect( (uint64_t)&v11,  (uint64_t)&v10,  (uint64_t)ConformingSuperclass,  v7);
      return v6 & 1;
    }

- (id)performSelector:(SEL)a3
{
  return [self a3];
}

- (id)performSelector:(SEL)a3 withObject:(id)a4
{
  return objc_msgSend(self, a3, a4);
}

- (id)performSelector:(SEL)a3 withObject:(id)a4 withObject:(id)a5
{
  return objc_msgSend(self, a3, a4, a5);
}

- (NSString)description
{
  uint64_t v8 = self;
  swift_retain((unint64_t *)self, (uint64_t)a2, v2, v3);
  uint64_t v5 = (swift *)((uint64_t)self->isa & 0xFFFFFFFF8LL);
  Description = (void *)swift_stdlib_getDescription((uint64_t)&v8, v5);
  (*(void (**)(_TtCs12_SwiftObject **, swift *))(*((void *)v5 - 1) + 8LL))(&v8, v5);
  return (NSString *)Description;
}

- (NSString)debugDescription
{
  uint64_t v8 = self;
  swift_retain((unint64_t *)self, (uint64_t)a2, v2, v3);
  uint64_t v5 = (swift *)((uint64_t)self->isa & 0xFFFFFFFF8LL);
  Description = (void *)swift_stdlib_getDescription((uint64_t)&v8, v5);
  (*(void (**)(_TtCs12_SwiftObject **, swift *))(*((void *)v5 - 1) + 8LL))(&v8, v5);
  return (NSString *)Description;
}

+ (id)description
{
  Name = (uint8x16_t *)class_getName((Class)a1);
  size_t v3 = strlen(Name->i8);
  return (id)swift_stdlib_NSStringFromUTF8(Name, v3);
}

+ (id)debugDescription
{
  Name = (uint8x16_t *)class_getName((Class)a1);
  size_t v3 = strlen(Name->i8);
  return (id)swift_stdlib_NSStringFromUTF8(Name, v3);
}

- (id)_copyDescription
{
  return -[_SwiftObject description](self, "description");
}

- (unint64_t)_cfTypeID
{
  return 1LL;
}

- (BOOL)isNSArray__
{
  return 0;
}

- (BOOL)isNSCFConstantString__
{
  return 0;
}

- (BOOL)isNSData__
{
  return 0;
}

- (BOOL)isNSDate__
{
  return 0;
}

- (BOOL)isNSDictionary__
{
  return 0;
}

- (BOOL)isNSObject__
{
  return 0;
}

- (BOOL)isNSOrderedSet__
{
  return 0;
}

- (BOOL)isNSNumber__
{
  return 0;
}

- (BOOL)isNSSet__
{
  return 0;
}

- (BOOL)isNSString__
{
  return 0;
}

- (BOOL)isNSTimeZone__
{
  return 0;
}

- (BOOL)isNSValue__
{
  return 0;
}

@end