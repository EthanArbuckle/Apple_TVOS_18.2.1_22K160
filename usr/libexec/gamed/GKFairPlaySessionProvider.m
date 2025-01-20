@interface GKFairPlaySessionProvider
- (GKFairPlaySessionProvider)init;
- (GKFairPlaySessionProvider)initWithSession:(id)a3;
- (void)fairPlaySessionWithStoreBag:(GKStoreBag *)a3 reporter:(GKReporter *)a4 completionHandler:(id)a5;
@end

@implementation GKFairPlaySessionProvider

- (GKFairPlaySessionProvider)initWithSession:(id)a3
{
  return (GKFairPlaySessionProvider *)sub_10016F270((uint64_t)a3);
}

- (void)fairPlaySessionWithStoreBag:(GKStoreBag *)a3 reporter:(GKReporter *)a4 completionHandler:(id)a5
{
  v8 = _Block_copy(a5);
  v9 = (void *)swift_allocObject(&unk_100275918, 48LL, 7LL);
  v9[2] = a3;
  v9[3] = a4;
  v9[4] = v8;
  v9[5] = self;
  v10 = a3;
  v11 = a4;
  swift_retain(self);
  sub_100188AB4((uint64_t)&unk_1002B9B40, (uint64_t)v9);
}

- (GKFairPlaySessionProvider)init
{
}

@end