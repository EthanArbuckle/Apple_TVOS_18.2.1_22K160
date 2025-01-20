@interface MetricsIdentifierCloudDataController
- (id)createRecordForKey:(id)a3 recordType:(id)a4;
- (id)identifierRecordType;
- (id)identifierStoreRecordType;
- (id)keyForRecordIdentifier:(id)a3;
- (id)recordIdentifierForKey:(id)a3;
- (void)dataSourceAccountDidChange:(id)a3;
- (void)dataSourceDidChange:(id)a3;
@end

@implementation MetricsIdentifierCloudDataController

- (void)dataSourceAccountDidChange:(id)a3
{
}

- (void)dataSourceDidChange:(id)a3
{
}

- (id)identifierStoreRecordType
{
  NSString v2 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(0xEF65726F74537265LL);
  return v2;
}

- (id)identifierRecordType
{
  NSString v2 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(0xEA00000000007265LL);
  return v2;
}

- (id)createRecordForKey:(id)a3 recordType:(id)a4
{
  v7 = v6;
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7;
}

- (id)keyForRecordIdentifier:(id)a3
{
  uint64_t v6 = v5;
  swift_unknownObjectRelease(a3);
  swift_release();
  if (v6)
  {
    NSString v7 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }

  else
  {
    NSString v7 = 0LL;
  }

  return v7;
}

- (id)recordIdentifierForKey:(id)a3
{
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  uint64_t v6 = v5;
  swift_retain(self);
  Class isa = sub_1000EF9B8(v4, v6).super.isa;
  swift_release();
  swift_bridgeObjectRelease();
  return isa;
}

@end