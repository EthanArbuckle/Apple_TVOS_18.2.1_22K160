@interface GKAppMetadataCache
- (GKAppMetadataCache)init;
- (GKAppMetadataCache)initWithPlayerID:(id)a3 language:(id)a4 error:(id *)a5;
- (void)deleteAllWithCompletionHandler:(id)a3;
@end

@implementation GKAppMetadataCache

- (GKAppMetadataCache)initWithPlayerID:(id)a3 language:(id)a4 error:(id *)a5
{
  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  uint64_t v8 = v7;
  uint64_t v9 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  return (GKAppMetadataCache *)sub_10017D224(v6, v8, v9, v10);
}

- (void)deleteAllWithCompletionHandler:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject(&unk_100276258, 32LL, 7LL);
  *(void *)(v5 + 16) = v4;
  *(void *)(v5 + 24) = self;
  swift_retain(self);
  sub_100188AB4((uint64_t)&unk_1002BA448, v5);
}

- (GKAppMetadataCache)init
{
}

@end