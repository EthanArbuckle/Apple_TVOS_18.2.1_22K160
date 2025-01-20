@interface GKGameInstallDataFetcher
+ (id)createAndReturnError:(id *)a3;
- (GKGameInstallDataFetcher)init;
- (void)fetchGameInstallInfoFor:(NSArray *)a3 completionHandler:(id)a4;
@end

@implementation GKGameInstallDataFetcher

+ (id)createAndReturnError:(id *)a3
{
  return 0LL;
}

- (void)fetchGameInstallInfoFor:(NSArray *)a3 completionHandler:(id)a4
{
  v6 = _Block_copy(a4);
  v7 = (void *)swift_allocObject(&unk_100275A40, 40LL, 7LL);
  v7[2] = a3;
  v7[3] = v6;
  v7[4] = self;
  v8 = a3;
  v9 = self;
  sub_100188AB4((uint64_t)&unk_1002B9B98, (uint64_t)v7);
}

- (GKGameInstallDataFetcher)init
{
}

- (void).cxx_destruct
{
}

@end