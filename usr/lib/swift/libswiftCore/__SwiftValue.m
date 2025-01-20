@interface __SwiftValue
+ (id)allocWithZone:(_NSZone *)a3;
- (BOOL)isEqual:(id)a3;
- (const)_swiftTypeMetadata;
- (const)_swiftValue;
- (id)_swiftTypeName;
- (id)debugDescription;
- (id)description;
- (unint64_t)hash;
- (void)dealloc;
@end

@implementation __SwiftValue

+ (id)allocWithZone:(_NSZone *)a3
{
  qword_18C565C20 = (uint64_t)"__SwiftValue cannot be instantiated";
  __break(1u);
  return result;
}

- (void)dealloc
{
  Class isa = self[1].super.isa;
  Class v4 = isa[-1].isa;
  uint64_t v5 = LODWORD(v4[10].isa) & 0xF8;
  ((void (*)(char *, Class))v4[1].isa)((char *)self + ((v5 + 39) & ~(v5 | 7)), isa);
  objc_destructInstance(self);
  swift_slowDealloc(self);
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3) {
    return 1;
  }
  if (!a3) {
    goto LABEL_82;
  }
  if (qword_18C486FC0 != -1) {
    dispatch_once_f( &qword_18C486FC0,  &getSwiftValueClass(void)::$_0::operator() const(void)::TheLazy,  (dispatch_function_t)getSwiftValueClass(void)::$_0::operator() const(void)::{lambda(void *)#1}::__invoke);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_82:
    LOBYTE(EquatableBaseType) = 0;
    return EquatableBaseType & 1;
  }

  uint64_t v5 = (uint64_t *)&self[1];
  v6 = (unint64_t *)&self[3];
  uint64_t v7 = atomic_load((unint64_t *)&self[3]);
  if (!v7)
  {
    uint64_t v8 = swift_conformsToProtocolCommon(*v5, (uint64_t)&protocol descriptor for Hashable);
    if (v8)
    {
      uint64_t v7 = v8;
      unint64_t HashableBaseType = (unint64_t)swift::hashable_support::findHashableBaseType(*v5);
    }

    else
    {
      uint64_t v11 = swift_conformsToProtocolCommon(*v5, (uint64_t)&protocol descriptor for Equatable);
      uint64_t v7 = v11 | 1;
      if (v11) {
        unint64_t HashableBaseType = (unint64_t)swift::findConformingSuperclass(*v5, *(void *)v11) | 1;
      }
      else {
        unint64_t HashableBaseType = 1LL;
      }
    }

    while (!__ldaxr(v6))
    {
      if (!__stlxr(v7, v6)) {
        goto LABEL_17;
      }
    }

    __clrex();
LABEL_17:
    v13 = (unint64_t *)&self[2];
    while (!__ldaxr(v13))
    {
      if (!__stlxr(HashableBaseType, v13)) {
        goto LABEL_22;
      }
    }

    __clrex();
  }

- (unint64_t)hash
{
  v2 = self;
  v3 = (unint64_t *)&self[3];
  unint64_t v4 = atomic_load((unint64_t *)&self[3]);
  if (!v4)
  {
    uint64_t v5 = swift_conformsToProtocolCommon((uint64_t)self[1].super.isa, (uint64_t)&protocol descriptor for Hashable);
    if (v5)
    {
      unint64_t v4 = v5;
      unint64_t HashableBaseType = (unint64_t)swift::hashable_support::findHashableBaseType((uint64_t)v2[1].super.isa);
    }

    else
    {
      uint64_t v7 = swift_conformsToProtocolCommon((uint64_t)v2[1].super.isa, (uint64_t)&protocol descriptor for Equatable);
      unint64_t v4 = v7 | 1;
      if (v7) {
        unint64_t HashableBaseType = (unint64_t)swift::findConformingSuperclass((uint64_t)v2[1].super.isa, *(void *)v7) | 1;
      }
      else {
        unint64_t HashableBaseType = 1LL;
      }
    }

    while (!__ldaxr(v3))
    {
      if (!__stlxr(v4, v3)) {
        goto LABEL_11;
      }
    }

    __clrex();
LABEL_11:
    v9 = (unint64_t *)&v2[2];
    while (!__ldaxr(v9))
    {
      if (!__stlxr(HashableBaseType, v9)) {
        goto LABEL_16;
      }
    }

    __clrex();
  }

- (id)description
{
  Class isa = (swift *)self[1].super.isa;
  int v3 = *(_DWORD *)(*((void *)isa - 1) + 80LL) & 0xF8;
  unint64_t v4 = (char *)self + ((unsigned __int16)(v3 + 39) & (unsigned __int16)~(_WORD)v3 & 0x1F8);
  BufferIn = swift::TargetMetadata<swift::InProcess>::allocateBufferIn((uint64_t)isa, v8);
  (*(void (**)(void *, char *, swift *))(*((void *)isa - 1) + 16LL))(BufferIn, v4, isa);
  id Description = swift::getDescription((uint64_t)BufferIn, isa);
  swift::TargetMetadata<swift::InProcess>::deallocateBufferIn((uint64_t)isa, v8);
  return Description;
}

- (id)debugDescription
{
  Class isa = (swift *)self[1].super.isa;
  int v3 = *(_DWORD *)(*((void *)isa - 1) + 80LL) & 0xF8;
  unint64_t v4 = (char *)self + ((unsigned __int16)(v3 + 39) & (unsigned __int16)~(_WORD)v3 & 0x1F8);
  BufferIn = swift::TargetMetadata<swift::InProcess>::allocateBufferIn((uint64_t)isa, v8);
  (*(void (**)(void *, char *, swift *))(*((void *)isa - 1) + 16LL))(BufferIn, v4, isa);
  id Description = swift::getDescription((uint64_t)BufferIn, isa);
  swift::TargetMetadata<swift::InProcess>::deallocateBufferIn((uint64_t)isa, v8);
  return Description;
}

- (const)_swiftTypeMetadata
{
  return self[1].super.isa;
}

- (id)_swiftTypeName
{
  TypeName = (uint8x16_t *)swift_getTypeName((unint64_t)self[1].super.isa, 1);
  return (id)swift_stdlib_NSStringFromUTF8(TypeName, v3);
}

- (const)_swiftValue
{
  int v2 = (uint64_t)self[1].super.isa[-1].isa[10].isa & 0xF8;
  return (const OpaqueValue *)((char *)self + ((unsigned __int16)(v2 + 39) & (unsigned __int16)~(_WORD)v2 & 0x1F8));
}

@end