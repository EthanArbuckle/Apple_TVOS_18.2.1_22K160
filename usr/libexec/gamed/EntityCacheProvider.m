@interface EntityCacheProvider
- (void)deleteAllCachesWithCompletionHandler:(id)a3;
- (void)deleteCacheWithPlayerID:(NSString *)a3 language:(NSString *)a4 completionHandler:(id)a5;
- (void)getCacheWithPlayerID:(NSString *)a3 language:(NSString *)a4 completionHandler:(id)a5;
@end

@implementation EntityCacheProvider

- (void)getCacheWithPlayerID:(NSString *)a3 language:(NSString *)a4 completionHandler:(id)a5
{
}

- (void)deleteCacheWithPlayerID:(NSString *)a3 language:(NSString *)a4 completionHandler:(id)a5
{
}

- (void)deleteAllCachesWithCompletionHandler:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject(&unk_1002747B8, 32LL, 7LL);
  *(void *)(v5 + 16) = v4;
  *(void *)(v5 + 24) = self;
  swift_retain(self);
  sub_100188AB4((uint64_t)&unk_1002B8FC8, v5);
}

@end