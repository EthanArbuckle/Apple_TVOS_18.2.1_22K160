@interface OSLogEventLiveStore
+ (id)liveLocalStore;
- (void)prepareWithCompletionHandler:(id)a3;
@end

@implementation OSLogEventLiveStore

- (void)prepareWithCompletionHandler:(id)a3
{
  v3 = (void (**)(id, OSLogEventLiveSource *, void))a3;
  v4 = objc_alloc_init(&OBJC_CLASS___OSLogEventLiveSource);
  v3[2](v3, v4, 0LL);
}

+ (id)liveLocalStore
{
  return objc_alloc_init(&OBJC_CLASS___OSLogEventLiveStore);
}

@end