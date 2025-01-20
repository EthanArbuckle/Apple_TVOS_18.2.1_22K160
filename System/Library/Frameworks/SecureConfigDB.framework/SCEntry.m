@interface SCEntry
- (_TtC14SecureConfigDB7SCEntry)init;
- (_TtC14SecureConfigDB7SCEntry)initWithData:(id)a3 metadata:(id)a4;
- (void)setMetadataWithKey:(id)a3 data:(id)a4;
@end

@implementation SCEntry

- (_TtC14SecureConfigDB7SCEntry)initWithData:(id)a3 metadata:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = sub_188B58A88();
  unint64_t v10 = v9;

  if (v7)
  {
    v11 = (objc_class *)sub_188B58B18();

    v12 = (uint64_t *)((char *)self + OBJC_IVAR____TtC14SecureConfigDB7SCEntry_data);
    uint64_t *v12 = v8;
    v12[1] = v10;
    v13 = self;
    sub_188B49A88(v8, v10);
  }

  else
  {
    v14 = (uint64_t *)((char *)self + OBJC_IVAR____TtC14SecureConfigDB7SCEntry_data);
    uint64_t *v14 = v8;
    v14[1] = v10;
    v15 = self;
    sub_188B49A88(v8, v10);
    v11 = (objc_class *)sub_188B4A1F8(MEMORY[0x18961AFE8]);
  }

  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC14SecureConfigDB7SCEntry_metadata) = v11;

  v18.receiver = self;
  v18.super_class = (Class)type metadata accessor for SCEntry();
  v16 = -[SCEntry init](&v18, sel_init);
  sub_188B49964(v8, v10);
  return v16;
}

- (void)setMetadataWithKey:(id)a3 data:(id)a4
{
  uint64_t v6 = sub_188B58B60();
  uint64_t v8 = v7;
  id v9 = a4;
  unint64_t v10 = self;
  uint64_t v11 = sub_188B58A88();
  unint64_t v13 = v12;

  v14 = (uint64_t *)((char *)v10 + OBJC_IVAR____TtC14SecureConfigDB7SCEntry_metadata);
  swift_beginAccess();
  swift_bridgeObjectRetain();
  sub_188B49A88(v11, v13);
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v16 = *v14;
  uint64_t *v14 = 0x8000000000000000LL;
  sub_188B47F24(v11, v13, v6, v8, isUniquelyReferenced_nonNull_native);
  uint64_t *v14 = v16;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_endAccess();
  sub_188B49964(v11, v13);

  swift_bridgeObjectRelease();
}

- (_TtC14SecureConfigDB7SCEntry)init
{
  result = (_TtC14SecureConfigDB7SCEntry *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end