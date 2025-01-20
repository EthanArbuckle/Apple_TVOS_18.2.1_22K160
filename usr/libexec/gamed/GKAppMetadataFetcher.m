@interface GKAppMetadataFetcher
+ (id)createFor:(id)a3 language:(id)a4 bag:(id)a5 error:(id *)a6;
- (GKAppMetadataFetcher)init;
- (void)fetchWithBundleIDs:(NSArray *)a3 adamIDs:(NSArray *)a4 batchSize:(int64_t)a5 ttl:(double)a6 refreshExpiredCompletion:(id)a7 completionHandler:;
@end

@implementation GKAppMetadataFetcher

+ (id)createFor:(id)a3 language:(id)a4 bag:(id)a5 error:(id *)a6
{
  uint64_t v9 = v8;
  static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  uint64_t v11 = v10;
  swift_unknownObjectRetain(a5);
  sub_10012D1D4();
  swift_unknownObjectRelease(a5);
  swift_bridgeObjectRelease(v11, v12);
  swift_bridgeObjectRelease(v9, v13);
  return 0LL;
}

- (void)fetchWithBundleIDs:(NSArray *)a3 adamIDs:(NSArray *)a4 batchSize:(int64_t)a5 ttl:(double)a6 refreshExpiredCompletion:(id)a7 completionHandler:
{
  uint64_t v8 = v7;
  v14 = _Block_copy(a7);
  v15 = _Block_copy(v8);
  uint64_t v16 = swift_allocObject(&unk_100273B10, 72LL, 7LL);
  *(void *)(v16 + 16) = a3;
  *(void *)(v16 + 24) = a4;
  *(void *)(v16 + 32) = a5;
  *(double *)(v16 + 40) = a6;
  *(void *)(v16 + 48) = v14;
  *(void *)(v16 + 56) = v15;
  *(void *)(v16 + 64) = self;
  v17 = a3;
  v18 = a4;
  v19 = self;
  sub_100188AB4((uint64_t)&unk_1002B8350, v16);
}

- (GKAppMetadataFetcher)init
{
}

- (void).cxx_destruct
{
}

@end