@interface SenderKeyDistributionManager.SenderKeyURIMismatchMetric
- (NSDictionary)dictionaryRepresentation;
- (NSString)name;
- (_TtCC17identityservicesd28SenderKeyDistributionManagerP33_E220278C37BF7A52CA212AA0DEF6BDED26SenderKeyURIMismatchMetric)init;
@end

@implementation SenderKeyDistributionManager.SenderKeyURIMismatchMetric

- (NSDictionary)dictionaryRepresentation
{
  uint64_t v3 = sub_1003F5CB4(&qword_1009BB080);
  uint64_t inited = swift_initStackObject(v3, v11);
  *(_OWORD *)(inited + 16) = xmmword_1007184C0;
  *(void *)(inited + 32) = 0x476567617373656DLL;
  *(void *)(inited + 40) = 0xEB00000000444955LL;
  uint64_t v5 = *(void *)&self->messageGUID[OBJC_IVAR____TtCC17identityservicesd28SenderKeyDistributionManagerP33_E220278C37BF7A52CA212AA0DEF6BDED26SenderKeyURIMismatchMetric_messageGUID];
  v6 = self;
  swift_bridgeObjectRetain(v5);
  NSString v7 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v5);
  *(void *)(inited + 48) = v7;
  unint64_t v8 = sub_10045C238(inited);

  sub_1003F5CB4(&qword_1009BB088);
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v8);
  return (NSDictionary *)isa;
}

- (NSString)name
{
  return (NSString *)String._bridgeToObjectiveC()();
}

- (_TtCC17identityservicesd28SenderKeyDistributionManagerP33_E220278C37BF7A52CA212AA0DEF6BDED26SenderKeyURIMismatchMetric)init
{
  result = (_TtCC17identityservicesd28SenderKeyDistributionManagerP33_E220278C37BF7A52CA212AA0DEF6BDED26SenderKeyURIMismatchMetric *)_swift_stdlib_reportUnimplementedInitializer("identityservicesd.SenderKeyURIMismatchMetric", 44LL, "init()", 6LL, 0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end