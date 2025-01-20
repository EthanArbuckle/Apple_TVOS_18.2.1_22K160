@interface PDProvisioningSupportDataManager
- (PDProvisioningSupportDataManager)init;
- (void)applyPostPersonalizedSupportDataIfNecessaryToPass:(id)a3;
- (void)clearKnownSupportDataOfType:(unint64_t)a3;
- (void)saveWithSupportData:(id)a3 completion:(id)a4;
@end

@implementation PDProvisioningSupportDataManager

- (void)saveWithSupportData:(id)a3 completion:(id)a4
{
  v6 = _Block_copy(a4);
  unint64_t v7 = sub_100417E50();
  uint64_t v8 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, v7);
  if (v6)
  {
    uint64_t v9 = swift_allocObject(&unk_10065F500, 24LL, 7LL);
    *(void *)(v9 + 16) = v6;
    v6 = sub_100417EC0;
  }

  else
  {
    uint64_t v9 = 0LL;
  }

  v10 = self;
  _s5passd30ProvisioningSupportDataManagerC4save07supportD010completionySaySo014PKProvisioningcD0CG_ys5Error_pSgcSgtF_0( v8,  (uint64_t)v6,  v9);
  sub_100417E8C((uint64_t)v6, v9);

  swift_bridgeObjectRelease(v8);
}

- (void)applyPostPersonalizedSupportDataIfNecessaryToPass:(id)a3
{
  id v4 = a3;
  v5 = self;
  _s5passd30ProvisioningSupportDataManagerC021applyPostPersonalizedcD11IfNecessary2toySo6PKPassC_tF_0(v4);
}

- (void)clearKnownSupportDataOfType:(unint64_t)a3
{
}

- (PDProvisioningSupportDataManager)init
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType(self);
  return -[PDProvisioningSupportDataManager init](&v3, "init");
}

@end