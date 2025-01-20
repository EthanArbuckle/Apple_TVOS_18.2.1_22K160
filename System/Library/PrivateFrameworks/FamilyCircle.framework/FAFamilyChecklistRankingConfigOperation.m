@interface FAFamilyChecklistRankingConfigOperation
- (_TtC13familycircled39FAFamilyChecklistRankingConfigOperation)initWithNetworkService:(id)a3;
- (void)familyChecklistRankingConfigWith:(unint64_t)a3 completionHandler:(id)a4;
@end

@implementation FAFamilyChecklistRankingConfigOperation

- (_TtC13familycircled39FAFamilyChecklistRankingConfigOperation)initWithNetworkService:(id)a3
{
  uint64_t v4 = OBJC_IVAR____TtC13familycircled39FAFamilyChecklistRankingConfigOperation_kFAFamilyChecklistRankingConfigURLEndpoint;
  id v5 = a3;
  v6 = self;
  *(Class *)((char *)&self->super.super.isa + v4) = (Class)String._bridgeToObjectiveC()();
  if (qword_100051CC8 != -1) {
    swift_once(&qword_100051CC8, sub_100024220);
  }
  uint64_t v7 = static FAFamilyChecklistRankingConfigCache.shared;
  v8 = (uint64_t *)((char *)v6 + OBJC_IVAR____TtC13familycircled39FAFamilyChecklistRankingConfigOperation_cache);
  v8[3] = type metadata accessor for FAFamilyChecklistRankingConfigCache();
  v8[4] = (uint64_t)&protocol witness table for FAFamilyChecklistRankingConfigCache;
  uint64_t *v8 = v7;
  swift_retain(v7);

  v11.receiver = v6;
  v11.super_class = (Class)type metadata accessor for FAFamilyChecklistRankingConfigOperation();
  v9 = -[FANetworkClient initWithNetworkService:](&v11, "initWithNetworkService:", v5);

  return v9;
}

- (void)familyChecklistRankingConfigWith:(unint64_t)a3 completionHandler:(id)a4
{
  v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  v9 = _Block_copy(a4);
  v10 = (void *)swift_allocObject(&unk_1000426F8, 40LL, 7LL);
  v10[2] = a3;
  v10[3] = v9;
  v10[4] = self;
  uint64_t v11 = type metadata accessor for TaskPriority(0LL);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56LL))(v8, 1LL, 1LL, v11);
  v12 = (void *)swift_allocObject(&unk_100042720, 48LL, 7LL);
  v12[2] = 0LL;
  v12[3] = 0LL;
  v12[4] = &unk_100052018;
  v12[5] = v10;
  v13 = (void *)swift_allocObject(&unk_100042748, 48LL, 7LL);
  v13[2] = 0LL;
  v13[3] = 0LL;
  v13[4] = &unk_100051F80;
  v13[5] = v12;
  v14 = self;
  uint64_t v15 = sub_10002950C((uint64_t)v8, (uint64_t)&unk_100051F88, (uint64_t)v13);
  swift_release(v15);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC13familycircled39FAFamilyChecklistRankingConfigOperation_kFAFamilyChecklistRankingConfigURLEndpoint));
  sub_10001F53C((Class *)((char *)&self->super.super.isa
                        + OBJC_IVAR____TtC13familycircled39FAFamilyChecklistRankingConfigOperation_cache));
}

@end