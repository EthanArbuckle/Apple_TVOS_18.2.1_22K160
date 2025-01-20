@interface TreatmentStoreService
- (_TtC14amsengagementd21TreatmentStoreService)init;
- (void)areasForNamespaces:(NSSet *)a3 cachePolicy:(int64_t)a4 completion:(id)a5;
- (void)areasForTopics:(NSSet *)a3 cachePolicy:(int64_t)a4 completion:(id)a5;
- (void)areasWithIDs:(NSSet *)a3 cachePolicy:(int64_t)a4 completion:(id)a5;
- (void)synchronizeTreatmentsWithCachePolicy:(int64_t)a3 completion:(id)a4;
- (void)treatmentsForAreas:(NSSet *)a3 cachePolicy:(int64_t)a4 startDate:(NSDate *)a5 endDate:(NSDate *)a6 completion:(id)a7;
@end

@implementation TreatmentStoreService

- (_TtC14amsengagementd21TreatmentStoreService)init
{
}

- (void)areasForNamespaces:(NSSet *)a3 cachePolicy:(int64_t)a4 completion:(id)a5
{
}

- (void)areasForTopics:(NSSet *)a3 cachePolicy:(int64_t)a4 completion:(id)a5
{
}

- (void)areasWithIDs:(NSSet *)a3 cachePolicy:(int64_t)a4 completion:(id)a5
{
}

- (void)synchronizeTreatmentsWithCachePolicy:(int64_t)a3 completion:(id)a4
{
  v6 = _Block_copy(a4);
  v7 = (void *)swift_allocObject(&unk_1001B3258, 40LL, 7LL);
  v7[2] = a3;
  v7[3] = v6;
  v7[4] = self;
  swift_retain(self);
  sub_10013EABC((uint64_t)&unk_1001CFA20, (uint64_t)v7);
}

- (void)treatmentsForAreas:(NSSet *)a3 cachePolicy:(int64_t)a4 startDate:(NSDate *)a5 endDate:(NSDate *)a6 completion:(id)a7
{
  v12 = _Block_copy(a7);
  v13 = (void *)swift_allocObject(&unk_1001B3000, 64LL, 7LL);
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = a5;
  v13[5] = a6;
  v13[6] = v12;
  v13[7] = self;
  v14 = a3;
  v15 = a5;
  v16 = a6;
  swift_retain(self);
  sub_10013EABC((uint64_t)&unk_1001CF930, (uint64_t)v13);
}

@end