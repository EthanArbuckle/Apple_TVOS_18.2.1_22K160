@interface JSTreatmentStore
- (_TtC14amsengagementd16JSTreatmentStore)init;
- (id)fetchNamespaceAreas:(id)a3;
- (id)fetchTopicAreas:(id)a3;
- (id)fetchTreatmentSets:(id)a3 :(id)a4;
- (id)fetchTreatments:(id)a3;
- (id)generateExperimentData:(id)a3;
- (id)generatePayload:(id)a3;
- (id)synchronize;
@end

@implementation JSTreatmentStore

- (id)fetchNamespaceAreas:(id)a3
{
  id v4 = a3;
  v5 = self;
  v6 = (void *)sub_1000B25F0((uint64_t)v4, (uint64_t)sub_1000B808C);

  return v6;
}

- (id)fetchTopicAreas:(id)a3
{
  id v4 = a3;
  v5 = self;
  v6 = (void *)sub_1000B25F0((uint64_t)v4, (uint64_t)sub_1000B7FD8);

  return v6;
}

- (id)fetchTreatments:(id)a3
{
  id v4 = a3;
  v5 = self;
  v6 = (void *)sub_1000B25F0((uint64_t)v4, (uint64_t)sub_1000B7E98);

  return v6;
}

- (id)fetchTreatmentSets:(id)a3 :(id)a4
{
  if (a4) {
    uint64_t v6 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)( a4,  &type metadata for String,  (char *)&type metadata for Any + 8,  &protocol witness table for String);
  }
  else {
    uint64_t v6 = 0LL;
  }
  id v7 = a3;
  v8 = self;
  v9 = (void *)sub_1000B3EAC((uint64_t)v7, v6);

  swift_bridgeObjectRelease();
  return v9;
}

- (id)generateExperimentData:(id)a3
{
  id v4 = a3;
  v5 = self;
  uint64_t v6 = (void *)sub_1000B25F0((uint64_t)v4, (uint64_t)sub_1000B79B4);

  return v6;
}

- (id)generatePayload:(id)a3
{
  id v4 = a3;
  v5 = self;
  uint64_t v6 = (void *)sub_1000B25F0((uint64_t)v4, (uint64_t)sub_1000B7180);

  return v6;
}

- (id)synchronize
{
  v2 = self;
  v3 = (void *)sub_1000B6540((uint64_t)v2);

  return v3;
}

- (_TtC14amsengagementd16JSTreatmentStore)init
{
  return (_TtC14amsengagementd16JSTreatmentStore *)sub_1000B6FC0();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14amsengagementd16JSTreatmentStore____lazy_storage___dateFormatter));
}

@end