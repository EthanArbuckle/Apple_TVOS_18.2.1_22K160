@interface SCDataBase
- (_TtC14SecureConfigDB10SCDataBase)init;
- (id)slotWithSlotID:(id)a3 algorithm:(id)a4 recordType:(id)a5 salt:(id)a6 error:(id *)a7;
@end

@implementation SCDataBase

- (_TtC14SecureConfigDB10SCDataBase)init
{
  uint64_t v2 = sub_188B58A40();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1895F8858](v2);
  v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  if (qword_18C73E778 != -1) {
    swift_once();
  }
  uint64_t v6 = __swift_project_value_buffer(v2, (uint64_t)qword_18C73E780);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v6, v2);
  id v7 = objc_allocWithZone((Class)type metadata accessor for SCDataBase());
  v8 = (_TtC14SecureConfigDB10SCDataBase *)SCDataBase.init(dbURL:)((uint64_t)v5);
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v8;
}

- (id)slotWithSlotID:(id)a3 algorithm:(id)a4 recordType:(id)a5 salt:(id)a6 error:(id *)a7
{
  uint64_t v10 = sub_188B58AD0();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x1895F8858](v10);
  v13 = (char *)v27 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  sub_188B58AC4();
  uint64_t v14 = sub_188B58B60();
  uint64_t v16 = v15;
  uint64_t v17 = sub_188B58B60();
  uint64_t v19 = v18;
  v27[1] = a7;
  uint64_t v28 = v10;
  v20 = self;
  if (a6)
  {
    id v21 = a6;
    uint64_t v22 = sub_188B58A88();
    unint64_t v24 = v23;
  }

  else
  {
    uint64_t v22 = 0LL;
    unint64_t v24 = 0xF000000000000000LL;
  }

  v25 = sub_188B46C3C((uint64_t)v13, v14, v16, v17, v19, v22, v24);
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v28);

  sub_188B49950(v22, v24);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v25;
}

- (void).cxx_destruct
{
  uint64_t v2 = (char *)self + OBJC_IVAR____TtC14SecureConfigDB10SCDataBase_dbURL;
  uint64_t v3 = sub_188B58A40();
  (*(void (**)(char *, uint64_t))(*(void *)(v3 - 8) + 8LL))(v2, v3);
  swift_bridgeObjectRelease();
}

@end