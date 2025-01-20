@interface Container.DBAdapter
- (BOOL)enumeratePeersUsingBlock:(id)a3 error:(id *)a4;
- (BOOL)enumerateVouchersUsingBlock:(id)a3 error:(id *)a4;
- (id)allPeerIDs:(id *)a3;
- (id)allRegisteredPolicyVersions:(id *)a3;
- (id)peerWithID:(id)a3 error:(id *)a4;
- (id)policyWithVersion:(unint64_t)a3 error:(id *)a4;
- (unint64_t)peerCount:(id *)a3;
- (unint64_t)voucherCount:(id *)a3;
@end

@implementation Container.DBAdapter

- (id)allPeerIDs:(id *)a3
{
  uint64_t v5 = v4;
  swift_release(self);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v5);
  return isa;
}

- (unint64_t)peerCount:(id *)a3
{
  return sub_1000E7094((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(uint64_t))sub_1000E4C50);
}

- (id)peerWithID:(id)a3 error:(id *)a4
{
  uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  uint64_t v7 = v6;
  swift_retain(self);
  v8 = sub_1000E5024(v5, v7);
  swift_release(self);
  swift_bridgeObjectRelease(v7);
  return v8;
}

- (BOOL)enumeratePeersUsingBlock:(id)a3 error:(id *)a4
{
  return sub_1000E6BE8( (uint64_t)self,  (int)a2,  a3,  (uint64_t)a4,  (uint64_t)&unk_1002395B8,  (uint64_t)sub_1001732BC,  sub_1000E5380);
}

- (BOOL)enumerateVouchersUsingBlock:(id)a3 error:(id *)a4
{
  return sub_1000E6BE8( (uint64_t)self,  (int)a2,  a3,  (uint64_t)a4,  (uint64_t)&unk_100239590,  (uint64_t)sub_100176F44,  (void (*)(uint64_t, uint64_t))sub_1000E6738);
}

- (unint64_t)voucherCount:(id *)a3
{
  return sub_1000E7094((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(uint64_t))sub_1000E6CBC);
}

- (id)policyWithVersion:(unint64_t)a3 error:(id *)a4
{
  uint64_t v7 = (void *)sub_1000E70E0(a3, a4);
  swift_release(self);
  return v7;
}

- (id)allRegisteredPolicyVersions:(id *)a3
{
  uint64_t v5 = v4;
  swift_release(self);
  sub_100007620(0LL, (unint64_t *)&qword_100256DB0, &OBJC_CLASS___TPPolicyVersion_ptr);
  sub_100171984( (unint64_t *)&qword_100256DE0,  (unint64_t *)&qword_100256DB0,  &OBJC_CLASS___TPPolicyVersion_ptr);
  Class isa = Set._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v5);
  return isa;
}

@end