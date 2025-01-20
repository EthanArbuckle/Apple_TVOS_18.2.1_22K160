@interface ActivityClass
- (OS_xpc_object)rawCriteria;
- (_TtC9appstored13ActivityClass)init;
- (const)rawRegisteredName;
@end

@implementation ActivityClass

- (OS_xpc_object)rawCriteria
{
  uint64_t v3 = type metadata accessor for XPCDictionary(0LL, a2);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  v7 = *(void (**)(void))((swift_isaMask & (uint64_t)self->super.isa) + 0x50);
  v8 = self;
  v7();
  uint64_t v9 = sub_1000079A0(&qword_100458BD8);
  XPCDictionary.withUnsafeUnderlyingDictionary<A>(_:)(&v12, sub_1000193C0, 0LL, v9);
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);

  return (OS_xpc_object *)v12;
}

- (const)rawRegisteredName
{
  return (const char *)sub_10001940C();
}

- (_TtC9appstored13ActivityClass)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ActivityClass();
  return -[ActivityClass init](&v3, "init");
}

@end