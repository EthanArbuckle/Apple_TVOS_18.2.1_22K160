@interface SCSlot
- (BOOL)append:(id)a3 error:(id *)a4;
- (_TtC14SecureConfigDB6SCSlot)init;
@end

@implementation SCSlot

- (BOOL)append:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = self;
  sub_188B54410((uint64_t)v5);

  return 1;
}

- (_TtC14SecureConfigDB6SCSlot)init
{
  result = (_TtC14SecureConfigDB6SCSlot *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC14SecureConfigDB6SCSlot_slotID;
  uint64_t v4 = sub_188B58AD0();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8LL))(v3, v4);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_188B49950( *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC14SecureConfigDB6SCSlot_saltData),  *(void *)&self->entries[OBJC_IVAR____TtC14SecureConfigDB6SCSlot_saltData]);
  sub_188B49E74((uint64_t)self + OBJC_IVAR____TtC14SecureConfigDB6SCSlot_slotURL, &qword_18C73E7C8);
}

@end