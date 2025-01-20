@interface GKGameActivityStore
- (GKGameActivityStore)init;
- (void)add:(GKGameActivityInternal *)a3 completionHandler:(id)a4;
- (void)fetchActivitiesWithBundleID:(NSString *)a3 ascending:(BOOL)a4 completionHandler:(id)a5;
- (void)fetchAndRemoveLatestActivityWithBundleID:(NSString *)a3 completionHandler:(id)a4;
- (void)removeActivitiesForBundleID:(NSString *)a3 completionHandler:(id)a4;
- (void)removeAllActivitiesWithCompletionHandler:(id)a3;
@end

@implementation GKGameActivityStore

- (GKGameActivityStore)init
{
  return (GKGameActivityStore *)GameActivityStore.init()();
}

- (void)add:(GKGameActivityInternal *)a3 completionHandler:(id)a4
{
}

- (void)fetchAndRemoveLatestActivityWithBundleID:(NSString *)a3 completionHandler:(id)a4
{
}

- (void)fetchActivitiesWithBundleID:(NSString *)a3 ascending:(BOOL)a4 completionHandler:(id)a5
{
  v8 = _Block_copy(a5);
  uint64_t v9 = swift_allocObject(&unk_100274268, 48LL, 7LL);
  *(void *)(v9 + 16) = a3;
  *(_BYTE *)(v9 + 24) = a4;
  *(void *)(v9 + 32) = v8;
  *(void *)(v9 + 40) = self;
  v10 = a3;
  swift_retain(self);
  sub_100188AB4((uint64_t)&unk_1002B8958, v9);
}

- (void)removeActivitiesForBundleID:(NSString *)a3 completionHandler:(id)a4
{
}

- (void)removeAllActivitiesWithCompletionHandler:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject(&unk_100274218, 32LL, 7LL);
  *(void *)(v5 + 16) = v4;
  *(void *)(v5 + 24) = self;
  swift_retain(self);
  sub_100188AB4((uint64_t)&unk_1002B8938, v5);
}

@end