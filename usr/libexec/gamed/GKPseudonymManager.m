@interface GKPseudonymManager
- (GKPseudonymManager)init;
- (void)fetchPseudonymWithCompletionHandler:(id)a3;
- (void)revokePseudonym:(NSString *)a3 completionHandler:(id)a4;
@end

@implementation GKPseudonymManager

- (GKPseudonymManager)init
{
  return (GKPseudonymManager *)PseudonymManager.init()();
}

- (void)fetchPseudonymWithCompletionHandler:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject(&unk_100275180, 32LL, 7LL);
  *(void *)(v5 + 16) = v4;
  *(void *)(v5 + 24) = self;
  v6 = self;
  sub_100188AB4((uint64_t)&unk_1002B97F8, v5);
}

- (void)revokePseudonym:(NSString *)a3 completionHandler:(id)a4
{
  v6 = _Block_copy(a4);
  v7 = (void *)swift_allocObject(&unk_100275158, 40LL, 7LL);
  v7[2] = a3;
  v7[3] = v6;
  v7[4] = self;
  v8 = a3;
  v9 = self;
  sub_100188AB4((uint64_t)&unk_1002B97E8, (uint64_t)v7);
}

- (void).cxx_destruct
{
}

@end