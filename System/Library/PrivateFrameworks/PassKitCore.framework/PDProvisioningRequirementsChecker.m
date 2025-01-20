@interface PDProvisioningRequirementsChecker
- (PDProvisioningRequirementsChecker)init;
- (PDProvisioningRequirementsChecker)initWithWebService:(id)a3 cloudStoreCoordinator:(id)a4;
- (void)meetsWithRequirementsContainer:(id)a3 completion:(id)a4;
@end

@implementation PDProvisioningRequirementsChecker

- (PDProvisioningRequirementsChecker)initWithWebService:(id)a3 cloudStoreCoordinator:(id)a4
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___PDProvisioningRequirementsChecker_webService) = (Class)a3;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___PDProvisioningRequirementsChecker_cloudStoreCoordinator) = (Class)a4;
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for ProvisioningRequirementsChecker();
  id v6 = a3;
  id v7 = a4;
  return -[PDProvisioningRequirementsChecker init](&v9, "init");
}

- (void)meetsWithRequirementsContainer:(id)a3 completion:(id)a4
{
  id v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject(&unk_100660168, 24LL, 7LL);
  *(void *)(v7 + 16) = v6;
  id v8 = a3;
  objc_super v9 = self;
  id v10 = [v8 provisioningSID];
  if (v10)
  {
    v12 = v10;
    uint64_t v13 = static String._unconditionallyBridgeFromObjectiveC(_:)(v10, v11);
    unint64_t v15 = v14;
  }

  else
  {
    uint64_t v13 = 0LL;
    unint64_t v15 = 0xE000000000000000LL;
  }

  uint64_t v16 = PKProvisioningRequirementsContainer.requirements.getter();
  uint64_t v17 = swift_allocObject(&unk_100660190, 32LL, 7LL);
  *(void *)(v17 + 16) = sub_10043055C;
  *(void *)(v17 + 24) = v7;
  swift_retain(v7);
  ProvisioningRequirementsChecker.meets(requirements:sid:completion:)(v16, v13, v15, (uint64_t)sub_100431144, v17);

  swift_release(v7);
  swift_bridgeObjectRelease(v15);
  swift_bridgeObjectRelease(v16);
  swift_release(v17);
}

- (PDProvisioningRequirementsChecker)init
{
  result = (PDProvisioningRequirementsChecker *)_swift_stdlib_reportUnimplementedInitializer( "passd.ProvisioningRequirementsChecker",  37LL,  "init()",  6LL,  0LL);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end